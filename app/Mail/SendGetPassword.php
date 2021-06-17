<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendGetPassword extends Mailable
{
    use Queueable, SerializesModels;
    public $send;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($send)
    {
        $this->send = $send;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('['.env('APP_NAME').'] Yêu cầu lấy lại mật khẩu')->view('emails.sendgetpassword');
    }
}
