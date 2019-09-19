<section class="bg-light page-section" id="portfolio">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading text-uppercase">Our Products</h2>
                <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
            </div>
        </div>
        <div class="row">
            @foreach($products as $product)
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a class="portfolio-link" data-toggle="modal" href="#portfolioModal-{{$product->id}}">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            {{--<i class="fas fa-cart-plus fa-3x" href="{{route('carts')}}"></i>--}}
                        </div>
                    </div>

                    @php $i = 1; @endphp
                    @foreach($product->images as $image)
                        @if($i>0)
                                <img class="card-image-top h-100 w-100" src="{{asset('images/products/'.$image->image)}}"
                                     alt="{{$product->title}}">
                        @endif
                        @php $i--; @endphp
                    @endforeach
                </a>
                <div class="portfolio-caption text-left">
                    <h4 class=" text-left">{{$product->title}}</h4>
                    <span class="text-black-50 text-left">
                        BDT- <strong> {{number_format($product->price)}}</strong>
                    </span>
                    <div class="text-right">
                        <input type="hidden" name="product_id" value="{{$product->id}}">
                        <button type="submit" class="btn btn-primary" onclick="addToCart({{$product->id}})"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
                    </div>

                </div>
            </div>
            @endforeach
            </div>
        </div>
</section>