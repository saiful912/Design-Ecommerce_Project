@extends('frontend.layouts.frontend_master')
@section('main')
    {{--start sidebar+content--}}
    <div class="container">
        <h3 class="text-center pt-3" style="margin-top: 100px">Search Products For- <span class="badge badge-primary">{{$search}}</span></h3>
        @include('frontend.partials._message')
        <div class="row">
            @foreach($products as $product)
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        @php $i = 1; @endphp
                        @foreach($product->images as $image)
                            @if($i>0)
                                <a href="">
                                    <img class="card-image-top h-100 w-100" src="{{asset('images/products/'.$image->image)}}"
                                         alt="{{$product->title}}">
                                </a>
                            @endif
                            @php $i--; @endphp
                        @endforeach

                        <div class="card-body">
                            <h3 class="card-text">
                                <a href="">{{$product->title}}</a>
                            </h3>
                            <div class="d-flex justify-content-between align-items-center">

                                <span class="text-black-50">
                                        BDT- <strong> {{$product->price}}</strong>
                                    </span>
                                <div class="text-right">
                                    <input type="hidden" name="product_id" value="{{$product->id}}">
                                    <button type="submit" class="btn btn-primary" onclick="addToCart({{$product->id}})"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        {{--<div class="pagination justify-content-center">--}}
        {{--{!! $products->links() !!}--}}
        {{--</div>--}}
    </div>
@stop