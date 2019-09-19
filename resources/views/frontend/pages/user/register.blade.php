@extends('frontend.layouts.frontend_master')
@section('main')
    <header class="masthead">
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="well mt-5 pt-5">
                        <h3 class="text-center">Register Your Account</h3>
                        @include('frontend.partials._message')

                        <form action="{{ route('register') }}" method="post" class="form form-horizontal"
                              enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input name="name" id="name" type="text" class="form-control" placeholder="Enter name"
                                       value="{{ old('name') }}">
                            </div>
                            <div class="form-group">
                                <label for="phone_no">Phone Number</label>
                                <input name="phone_no" id="phone_no" type="text" class="form-control"
                                       placeholder="Enter phone number" value="{{ old('phone_no') }}">
                            </div>

                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input name="email" id="email" type="email" class="form-control" placeholder="Enter email"
                                       value="{{ old('email') }}">
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <input name="password" id="password" type="password" class="form-control"
                                       placeholder="Enter password">
                            </div>

                            <div class="form-group">
                                <label for="confirm_password">Confirm Password</label>
                                <input name="password_confirmation" id="confirm_password" type="password"
                                       class="form-control" placeholder="Enter password again">
                            </div>

                            <div class="form-group">
                                <label for="address">Address</label>
                                <input name="address" id="address" type="text" class="form-control"
                                       placeholder="Enter Address" value="{{ old('address') }}">
                            </div>

                            <div class="form-group">
                                <label for="image">Profile Image</label>
                                <input name="image" id="image" type="file" class="form-control" placeholder="Enter Image"
                                       value="{{ old('image') }}">
                            </div>


                            <button type="submit" class="btn btn-primary btn-block mb-5">
                                Register
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </header>
@stop
