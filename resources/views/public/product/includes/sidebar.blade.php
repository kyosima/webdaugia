{{-- <div class="col-lg-3 col-md-5 d-none d-md-block">
    <div class="sidebar">
        <div class="sidebar__item">
            <h4>Danh mục</h4>
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <?php 
                        $categories = App\Models\ProductCategory::whereParentId(0)->latest()->get();
                    ?>
                    @foreach($categories as $category)
                        <div class="panel-heading">
                            <b class="panel-title">
                                <a href="{{url('cua-hang/'.$category->slug)}}">
                                </span>{{$category->title}}</a>
                                @if($category->categories()->count() !=0)
                                <a class="expand" data-toggle="collapse" data-parent="#accordion" href="#collapse{{$category->id}}"><i class="material-icons">add</i></a>
                                @endif
                            </b>
                        </div>
                        @if($category->categories() != null)
                            <div id="collapse{{$category->id}}" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <table class="table">
                                        @foreach($category->categories()->get() as $child)
                                            <tr>
                                                <td>
                                                    <span class="glyphicon glyphicon-pencil text-primary"></span><a href="{{url('cua-hang/'.$child->slug)}}">{{$child->title}}</a>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </table>
                                </div>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
           
        </div>
        
        <div class="sidebar__item">
            <div class="latest-product__text">
                <h4>Latest Products</h4>
                <?php $products = App\Models\Product::latest()->paginate(10);?>
                <div class="latest-product__slider owl-carousel">
                    <div class="latest-prdouct__slider__item">
                        @for($i=0; $i< count($products)/2; $i++)
                        <a href="{{route('san-pham.show',['san_pham'=>$products[$i]->slug])}}" class="latest-product__item">
                            <div class="latest-product__item__pic">
                                <img src="{{getImage($products[$i]->avatar)}}" alt="">
                            </div>
                            <div class="latest-product__item__text">
                                <h6>{{$products[$i]->title}}</h6>
                                <span>@include('public.product.includes.price',['item'=>$products[$i]])</span>
                            </div>
                        </a>
                        @endfor
                      
                    </div>
                    <div class="latest-prdouct__slider__item">
                        @for($i=count($products)/2; $i< count($products); $i++)
                            <a href="{{route('san-pham.show',['san_pham'=>$products[$i]->slug])}}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{getImage($products[$i]->avatar)}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>{{$products[$i]->title}}</h6>
                                    <span>@include('public.product.includes.price',['item'=>$products[$i]])</span>
                                </div>
                            </a>
                        @endfor
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> --}}