<?php

namespace App\Jobs;

use App\Models\Bill;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class SendMailToAdmin implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable;

    protected $bill;
    protected $info;
    protected $products;
    
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(Bill $bill, $info, $products)
    {
        $this->bill = $bill;
        $this->info = $info;
        $this->products = $products;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $userEmail = $this->info->email;
        // send mail
        $content = [
            'name' => $this->info->name,
            'phone' => $this->info->phone,
            'email' => $userEmail,
            'address' => $this->info->address,
            'billID' => $this->bill->id,
            'items' => $this->products,
            'subtotal' => $this->bill->bill_subtotal,
            'total' => $this->bill->bill_total,
            'promo' => $this->bill->bill_promo,
            'coupon' => $this->bill->bill_coupon,
            'payment' => $this->bill->payment_method,
        ];

        $message = view('emails.sendMailToUser');

        Mail::send('emails.sendMailToAdmin', $content, function ($message) {
            $message->to('quocminh.brave@gmail.com')->subject('Có đơn hàng mới');
        });
    }
}
