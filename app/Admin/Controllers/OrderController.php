<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Bill;
use App\Models\BillDetail;
use App\Models\Product;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use \Cviebrock\EloquentSluggable\Services\SlugService;
use App\Admin\Selectable\Products;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(trans('Tất cả đơn hàng'))
            // ->description(trans('admin.description'))
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header(trans('Chi tiết đơn hàng'))
            // ->description(trans('admin.description'))
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        $bill = Bill::findOrFail($id);

        $products = Product::all();
        return $content
            ->header(trans('Sửa đơn hàng'))
            // ->description(trans('admin.description'))
            // ->body($this->form($id)->edit($id));
            ->view('customForm', [
                'bill' => $bill,
                'products' => $products
            ]);
    }

    public function updateOrder(Request $request, $id){
        $bill = Bill::findOrFail($id);
        $billDetail = $bill->bill_detail;
        $total = 0;
        $soluong = 0;
        foreach ($request->order_item_id as $item_id) {
            $bill->bill_detail()->updateExistingPivot($item_id, [
                'end_price' => $request->order_item_price[$item_id],
                'SL' => $request->order_item_qty[$item_id],
            ]);
            $total += $request->order_item_price[$item_id] * $request->order_item_qty[$item_id];
            $soluong +=  $request->order_item_qty[$item_id];
        }

        $bill->bill_status = $request->bill_status;
        $bill->payment_method = $request->payment_method;
        $bill->note = $request->note;
        $bill->bill_total = $total;
        $bill->bill_soluong = $soluong;
        $bill->bill_address->name = $request->bill_address['name'];
        $bill->bill_address->email = $request->bill_address['email'];
        $bill->bill_address->phone = $request->bill_address['phone'];
        $bill->bill_address->address = $request->bill_address['address'];

        $bill->save();
        $bill->bill_address->save();

        return redirect()->route('admin.orders.edit', $id);
    }

    public function updateQtyProduct(Request $request, $id){
        $bill = Bill::findOrFail($id);
        $total = 0;
        $soluong = 0;

        $bill->bill_detail()->updateExistingPivot($request->item_id, [
            'end_price' => $request->edited_price,
            'SL' => $request->edited_qty,
        ]);

        foreach($bill->bill_detail as $item){
            $total += $item->getOriginal('pivot_end_price')*$item->getOriginal('pivot_SL');
            $soluong +=  $item->getOriginal('pivot_SL');
        }

        $bill->update([
            'bill_total' => $total,
            'bill_soluong' => $soluong,
        ]);

        $viewTableProduct = view('tableProductOrder', compact('bill'))->render();
        $viewTableTotal = view('tableTotal', compact('bill'))->render();
        return response()->json([
            $viewTableProduct,
            $viewTableTotal
        ],200);
    }

    public function addProductToOrder(Request $request, $id) {
        $bill = Bill::findOrFail($id);
        $arrId = DB::table('bill_detail')->select('id_ofproduct')->where('id_ofbill', $bill->id)->distinct()->get()->toArray();
        // convert type value of array TO array
        $arrId = array_map(function ($value) {
            return (array)$value;
        }, $arrId);
        // convert array of arrays to single array
        $arrId = array_column($arrId, 'id_ofproduct');

        $total = $bill->bill_total;
        $soluong = $bill->bill_soluong;
        foreach ($request->item_id as $index => $item_id) {
            // HIEN TAI MAY NO KH HIEU
            // TH $bill_detail[1]['id'] la gi
            // BOI VI TRONG BILL_DETAIL CHI MOI CO DUNG 1 SAN PHAM 
            // NEN KH NHAY VAO LENH IF DE CAP NHAT DC
            if(!in_array($item_id, $arrId)){
                $product = Product::where('id', $item_id)->first();
                $soluong += 1; 
                if($product->discount == NULL){
                    $total += $product->price;
                } else {
                    $total += round($product->price*(1-$product->discount/100));
                }
                BillDetail::create([
                    'id_ofbill' => $bill->id,
                    'id_ofproduct' => $product->id,
                    'end_price' => $product->discount == NULL ? $product->price : round($product->price*(1-$product->discount/100)),
                    'SL' => 1,
                ]);
            }
        }
        $bill->update([
            'bill_soluong' => $soluong,
            'bill_subtotal' => $total,
            'bill_total' => $total,
        ]);
        $viewTableProduct = view('tableProductOrder', compact('bill'))->render();
        $viewTableTotal = view('tableTotal', compact('bill'))->render();
        return response()->json([
            $viewTableProduct,
            $viewTableTotal
        ],200);
    }

    public function deleteProduct(Request $request, $id){
        $bill = Bill::findOrFail($id);
        $item_delete = DB::table('bill_detail')->where('id_ofbill', $id)
                                ->where('id_ofproduct', $request->item_id);
        // kiem tra lai so luong + tong tien va cap nhat
        $soluong = $item_delete->first()->SL;
        $giaban = $item_delete->first()->end_price;
        $newSoluong = $bill->bill_soluong - $soluong;

        $total = $giaban*$soluong;
        $newSubtotal = $bill->bill_subtotal - $total;
        if($bill->bill_promo > 0) {
            $newtotal = $bill->bill_total - $total - $bill->bill_promo;
        } else {
            $newtotal = $bill->bill_total - $total;
        }
        $bill->update([
            'bill_subtotal' => $newSubtotal,
            'bill_soluong' => $newSoluong,
            'bill_total' =>  $newtotal
        ]);

        // xoa san pham tuong ung o bill detail
        $item_delete->delete();
        // render view
        $viewTableProduct = view('tableProductOrder', compact('bill'))->render();
        $viewTableTotal = view('tableTotal', compact('bill'))->render();
        return response()->json([
            $viewTableProduct,
            $viewTableTotal
        ],200);
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header(trans('Tạo đơn hàng'))
            // ->description(trans('admin.description'))
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Bill);
        $grid->model()->latest();
        $grid->id('ID')->hide();

        $grid->column('bill_address', 'Đơn hàng')->display(function($info){
            return '#'.$this->id. ' '.$info['name'];
        }); 

        // $grid->bill_detail()->display(function ($roles) {

        //     $roles = array_map(function ($role) {
        //         return "<span class='label label-success'>{$role['pivot']['SL']}</span>";
        //     }, $roles);
        
        //     dd($roles);
        // });

        $grid->column('bill_status', 'Trạng thái đơn hàng')->using([
            '0' => 'Chờ thanh toán',
            '1' => 'Đang xử lý',
            '2' => 'Đã hoàn tất',
            '3' => 'Đã hủy'
        ])->label([
            0 => 'default',
            1 => 'warning',
            2 => 'success',
            3 => 'info',
        ]);

        $grid->column('created_at', 'Ngày đặt hàng')->display(function($created_at){
            $date = date_create($created_at);
            return date_format($date, 'd-m-Y H:i:s');
        })->filter('range', 'date');

        $grid->column('bill_total', 'Tổng đơn hàng');

        // $grid->updated_at(trans('admin.updated_at'));
        $grid->filter(function($filter){

            // Remove the default id filter
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->equal('ID')->integer();
            });
            $filter->column(1/2, function ($filter) {
                // $filter->contains('name', 'Tên')->placeholder('Tên danh mục...');
                // $filter->equal('bill_address')->placeholder('Tên khách hàng');
                $filter->where(function ($query) {
                    $query->whereHas('bill_address', function ($query) {
                        $query->where('name', 'like', "%{$this->input}%");
                    });
                }, 'Tên khách hàng');
            });       
        
        });
        $grid->actions(function ($actions) {
            $actions->disableView();
        });
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Bill::findOrFail($id));

        $show->id('Mã đơn hàng');
        $show->field('bill_address.name', __('Tên khách hàng'));
        $show->field('bill_address.phone', __('SĐT'));
        $show->field('bill_address.address', __('Địa chỉ giao hàng'));
        $show->field('payment_method', __('Phương thức thanh toán'));
        $show->field('bill_status', __('Trạng thái đơn hàng'));
        $show->field('bill_soluong', __('Số lượng'));
        $show->field('bill_subtotal', __('Tổng tạm tính'));
        $show->field('bill_promo', __('Giảm giá'));
        $show->field('bill_coupon', __('Mã giảm giá'));
        $show->field('bill_total', __('Tổng cộng'));
        $show->created_at(trans('Ngày đặt'));
        $show->updated_at(trans('Ngày cập nhật'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form($id = null)
    {
        $form = new Form(new Bill);

        $form->tab('Thông tin khách hàng', function ($form) use ($id) {
            $form->text('bill_address.name', 'Tên KH')->required()->autofocus();
            $form->text('bill_address.phone', 'SĐT')->rules([
                'required',
                'regex:/((09|03|07|08|05)+([0-9]{8})\b)|(84)\d{9}/'
            ]);
            $form->email('bill_address.email', 'Email')->rules('required|email');
            $form->text('bill_address.address', 'Địa chỉ')->required();
        })->tab('Thông tin đơn hàng', function($form) use ($id) {
            // $form->text('id', 'Mã đơn hàng')->readonly()->required();
            $form->select('payment_method', 'Phương thức thanh toán')->options([
                1 => 'COD',
                2 => 'Chuyển khoản ngân hàng',
            ])->required()->default('payment_method');
            $form->select('bill_status', 'Trạng thái đơn hàng')->options([
                0 => 'Chờ thanh toán',
                1 => 'Đang xử lý',
                2 => 'Đã hoàn tất',
                3 => 'Đã hủy',
            ])->required()->default('bill_status');
            $form->text('note', 'Ghi chú đơn hàng');
            $form->text('bill_soluong', 'Tổng số lượng')->rules([
                'required',
                'regex:/^[0-9]*$/'
            ])->default(0)->readonly();
            $form->text('bill_subtotal', 'Tổng tạm tính')->rules([
                'required',
                'regex:/^[0-9]*$/'
            ])->default(0)->readonly();
            // $form->text('bill_promo', 'Giảm giá')->rules([
            //     'regex:/^[0-9]*$/'
            // ]);
            // $form->text('bill_coupon', 'Mã giảm giá');
            // $form->text('bill_soluong', 'Số lượng')->rules([
            //     'regex:/^[0-9]*$/',
            //     'required'
            // ]);
            $form->text('bill_total', 'Tổng đơn hàng')->rules([
                'required',
                'regex:/^[0-9]*$/'
            ])->default(0)->readonly();
        })->tab('Sản phẩm', function($form) use ($id){
            // $form->belongsToMany('bill_detail', Products::class,__('Sản phẩm'));
                $form->inputProductOrder();
        });

        return $form;
    }

    
}
