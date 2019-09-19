@foreach($products as $product)
<div class="portfolio-modal modal fade" id="portfolioModal-{{$product->id}}" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl"></div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2 class="text-uppercase">{{$product->title}}</h2>
                                @php $i = 1; @endphp
                                @foreach($product->images as $image)
                                    @if($i>0)
                                        <img class="card-image-top h-100 w-100" src="{{asset('images/products/'.$image->image)}}"
                                             alt="{{$product->title}}">
                                    @endif
                                    @php $i--; @endphp
                                @endforeach
                            <p>{{$product->description}}</p>
                            <div class="mb-2">
                                <input type="hidden" name="product_id" value="{{$product->id}}">
                                <button type="submit" class="btn btn-primary" onclick="addToCart({{$product->id}})"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
                            </div>
                            <ul class="list-inline">
                                <li>Upload: {{$product->created_at}}</li>
                                <li>Category: {{$product->category->name}}</li>
                            </ul>

                            <button class="btn btn-primary" data-dismiss="modal" type="button">
                                <i class="fas fa-times"></i>
                                Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endforeach

