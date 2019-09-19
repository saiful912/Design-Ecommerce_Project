<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public $guarded=[];

    public function user()
    {
        $this->belongsTo(User::class);
    }
    public function carts()
    {
        return $this->hasMany(Cart::class);
    }
    public function payment()
    {
        return $this->belongsTo(Payment::class);
    }
}
