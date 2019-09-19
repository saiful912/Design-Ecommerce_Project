@extends('backend.layouts.master')
@section('main')
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="card">
                <div class="card-header">
                    Edit Category
                </div>
                <div class="card-body">
                    @include('backend.partials._message')
                    <form action="{{route('admin.category.update',$category->id)}}" method="post"
                          enctype="multipart/form-data">
                        {{csrf_field()}}
                        @include('backend.partials._message')
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" name="name" id="name" value="{{$category->name}}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputText">Description</label>
                            <textarea class="form-control" rows="4" cols="40" name="description"
                                      id="exampleInputText">{{$category->description}}</textarea>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputText">Parent Category</label>
                            <select class="form-control" name="parent_id">
                                <option value="">Please select a Primary Category</option>
                                @foreach(App\Models\Category::orderBy('name','asc')->where('parent_id',null)->get() as $parent)
                                    <option value="{{$parent->id}}"{{$parent->id==$category->parent_id ? 'selected':''}}>{{$parent->name}}</option>
                                @endforeach
                                @foreach(App\Models\Category::orderBy('name','asc')->where('parent_id',$parent->id)->get() as $child)
                                    <option value="{{$child->id}}"{{$child->id==$category->parent_id ? 'selected':''}}> >------>{{$child->name}}</option>
                                    @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="old_image">Category Old Image</label><br>
                            <img src="{!! asset('images/categories/'.$category->image) !!}" width="100">
                        </div>

                        <div class="form-group">
                            <label for="new_image">Category New Image</label>
                            <input type="file" class="form-control" name="image" id="new_image">
                        </div>
                        <button type="submit" class="btn btn-success">Update Categories</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@stop