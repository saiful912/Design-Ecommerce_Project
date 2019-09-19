@extends('backend.layouts.master')
@section('main')
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="card">
                <div class="card-header">
                    Manage Products
                </div>
                @include('backend.partials._message')

                <div class="card-body">
                    <a href="#addProductModal" data-toggle="modal" class="btn btn-info float-right mb-2">
                        <i class="mdi mdi-plus"></i>Add new Product
                    </a>
                    <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Add new Product</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="{!! route('admin.product.store') !!}" method="post" enctype="multipart/form-data">
                                        {{csrf_field()}}
                                        <div class="form-group">
                                            <label for="exampleInputText">Title</label>
                                            <input type="text" class="form-control" name="title" id="exampleInputText">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputText">Description</label>
                                            <textarea class="form-control" rows="4" cols="40" name="description" id="exampleInputText"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputText">Price</label>
                                            <input type="number" class="form-control" name="price" id="exampleInputText">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputText">Quantity</label>
                                            <input type="number" class="form-control" name="quantity" id="exampleInputText">
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputText">Select Category</label>
                                            <select name="category_id" class="form-control">
                                                <option value="">Please select a category for the product</option>
                                                @foreach(App\Models\Category::orderBy('name','asc')->where('parent_id',NULL)->get() as $parent)
                                                    <option value="{{$parent->id}}">{{$parent->name}}</option>
                                                    @foreach(App\Models\Category::orderBy('name','asc')->where('parent_id',$parent->id)->get() as $child)
                                                        <option value="{{$child->id}}"> >------>{{$child->name}}</option>
                                                    @endforeach

                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputText">Select Brands</label>
                                            <select name="brand_id" class="form-control">
                                                <option value="">Please select a brand for the product</option>
                                                @foreach(App\Models\Brand::orderBy('name','asc')->get() as $brand)
                                                    <option value="{{$brand->id}}">{{$brand->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="productImage">Product Image</label>
                                            <input type="file" class="form-control" name="product_image" id="productImage">
                                        </div>

                                        <button type="submit" class="btn btn-primary">Add Product</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-bordered table-hover" id="dataTable">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Product Code</th>
                            <th>Product Title</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($products as $product)
                            <tr>
                                <td>#</td>
                                <td>#PLE{{$product->id}}</td>
                                <td>{{$product->title}}</td>
                                <td>{{$product->price}}</td>
                                <td>{{$product->quantity}}</td>
                                <td>
                                    <a href="{{route('admin.products.edit',$product->id)}}" class="btn btn-success">Edit</a>
                                    <a href="#deleteModal{{$product->id}}" data-toggle="modal" class="btn btn-danger">Delete</a>

                                    <!-- Modal -->
                                    <div class="modal fade" id="deleteModal{{$product->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Are you sure to delete!</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="{!! route('admin.product.delete',$product->id) !!}" method="post">
                                                        {{csrf_field()}}
                                                        <button type="submit" class="btn btn-danger">Permanent Delete</button>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@stop