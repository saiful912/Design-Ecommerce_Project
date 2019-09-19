<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="csrf-token" content="{{csrf_token()}}">

    <title>Laravel Design Template</title>

    <!-- Bootstrap core CSS -->
    <link href="{{mix('css/app.css')}}" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="{{asset('css/fontawesome.min.css')}}" rel="stylesheet">
    <link href="{{asset('css/alertify.min.css')}}" rel="stylesheet">
    <link href="{{asset('css/alertify_bootstrap.min.css')}}" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="{{mix('css/agency.min.css')}}" rel="stylesheet">

</head>

<body id="page-top">

<!-- Navigation -->
@include('frontend.partials._navbar')


<main role="main">



    @yield('main')

</main>



<!-- Footer -->
@include('frontend.partials._footer')


<!-- Bootstrap core JavaScript -->
<script src="{{mix('js/app.js')}}"></script>

<!-- Custom scripts for this template -->
<script src="{{mix('js/agency.min.js')}}"></script>
<script src="{{asset('js/jquery.easing.min.js')}}"></script>
<script src="{{asset('js/alertify.min.js')}}"></script>
@yield('scripts')

{{--ajax setup--}}
<script>
    $.ajaxSetup({
        headers:
            {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}
    });

    function addToCart(product_id) {
        $.post("http://new_project.test/carts/store",
            {
                product_id: product_id
            })
            .done(function (data) {
                data = JSON.parse(data);
                if (data.status == 'success') {
                    //toast
                    alertify.set('notifier', 'position', 'top-center');
                    alertify.success('Item Added To Cart Successfully !! Total Items: ' + data.totalItems
                        + '<br> To Checkout <a href="{{route('carts')}}">go to Checkout page</a>');
                    $("#totalItems").html(data.totalItems);
                }
            });
    }
</script>

</body>

</html>