@extends('backend.layouts.master')
@section('main')
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="card">
                <div class="card-header">
                    Manage Categories
                </div>
                @include('backend.partials._message')
                <div class="card-body">
                    <a href="#addCategoryModal" data-toggle="modal" class="btn btn-info float-right mb-2">
                        <i class="mdi mdi-plus"></i>Add new Category
                    </a>
                    <div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Add new Category</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="{{route('admin.category.store')}}" method="post" enctype="multipart/form-data">
                                        @csrf
                                        @include('backend.partials._message')
                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <input type="text" class="form-control" name="name" id="name">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputText">Description</label>
                                            <textarea class="form-control" rows="4" cols="40" name="description" id="exampleInputText"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputText">Parent Category (optional)</label>
                                            <select class="form-control" name="parent_id">
                                                <option value="">Please select a parent category</option>
                                                @foreach(App\Models\Category::orderBy('name','asc')->where('parent_id',null)->get() as $parent)
                                                    <option value="{{$parent->id}}">{{$parent->name}}</option>
                                                @endforeach
                                                @foreach(App\Models\Category::orderBy('name','asc')->where('parent_id',$parent->id)->get() as $child)
                                                    <option value="{{$child->id}}"> >------>{{$child->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="image">Category Image</label>
                                            <input type="file" class="form-control" name="image" id="image">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Add Categories</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-bordered table-hover" id="dataTable">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Category Name</th>
                            <th>Category Image</th>
                            <th>Parent Category</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($categories as $category)
                            <tr>
                                <td>#</td>
                                <td>{{$category['name']}}</td>
                                <td>
                                    <img src="{!! asset('images/categories/'.$category->image) !!}" width="160">
                                </td>
                                <td>
                                    @if($category->parent_id == null)
                                        id_nullable
                                    @else
                                        {{$category->parent['name']}}
                                    @endif
                                </td>
                                <td>
                                    <a href="{{route('admin.categories.edit',$category->id)}}" class="btn btn-success">Edit</a>
                                    <a href="#deleteModal{{$category->id}}" data-toggle="modal" class="btn btn-danger">Delete</a>

                                    <!-- Modal -->
                                    <div class="modal fade" id="deleteModal{{$category->id}}" tabindex="-1"
                                         role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Are you sure to
                                                        delete!</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="{!! route('admin.category.delete',$category->id) !!}"
                                                          method="post">
                                                        {{csrf_field()}}
                                                        <button type="submit" class="btn btn-danger">Permanent Delete
                                                        </button>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Cancel
                                                    </button>

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