@extends('frontend.layouts.frontend_master')
@section('main')
    <!-- Header -->
    @include('frontend.partials._header')
    <!-- Services -->
    <!-- Portfolio Grid -->
    @include('frontend.partials._product')
    @include('frontend.partials._team')
    <!-- Clients -->
    @include('frontend.partials._clients')
    <!-- Contact -->
    @include('frontend.partials._contact')
    <!-- Portfolio Modals -->
    <!-- Modal start -->
    @include('frontend.partials._modal')
    {{--modal end--}}
@stop
