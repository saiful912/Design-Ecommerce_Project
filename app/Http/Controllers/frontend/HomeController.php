<?php

namespace App\Http\Controllers\frontend;

use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{
    public function index()
    {
        $products=Product::orderBy('id')->get();
        return view('frontend.home',compact('products'));
    }

    public function search(Request $request)
    {
        $search = $request->search;
        $products = Product::orWhere('title', 'like', '%' . $search . '%')
            ->orWhere('slug', 'like', '%' . $search . '%')
            ->orWhere('price', 'like', '%' . $search . '%')
            ->orWhere('quantity', 'like', '%' . $search . '%')
            ->orderBy('id', 'desc')->get();
        return view('frontend.pages.product.search', compact('products', 'search'));
    }
}
