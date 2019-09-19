@extends('frontend.layouts.frontend_master')
@section('main')
    <div class="widget">
        <h3 class="text-center">Product in <span class="badge badge-info">{{$category->name}} Category</span></h3>
        @php
            $products=$category->products()->get();
        @endphp

        @if($products->count() > 0)
            @include('frontend.partials._product')
        @else
            <div class="alert alert-warning">
                No Products has added yet in this category |
            </div>
        @endif
    </div>
@stop