<nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark" id="mainNav">
<div class="container">
        <div id="nav">
            <ul>
                <li><a href="#" class="text-white rounded">Categories &raquo;</a>
                    <ul>
                        @foreach(App\Models\Category::orderBy('name','asc')->where('parent_id',NULL)->get() as $parent)
                        <li class="main">
                            <a href="{{route('categories.show',$parent->id)}}" class="rounded mb-2">
                                {{$parent->name}}  &raquo;
                            </a>
                        </li>
                            @endforeach
                    </ul>
                </li>
            </ul>
        </div>


        <a class="navbar-brand js-scroll-trigger" href="{{route('home')}}">Start Home</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <form class="form-inline" action="{{route('search')}}" method="get">
                <input class="form-control mr-1 w-auto" name="search" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#portfolio">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#team">Team</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
                </li>
                @auth()
                    <li class="nav-item">
                        <a href="{{route('profile')}}" class="nav-link js-scroll-trigger">
                            Profile ({{optional(auth()->user())->name}})
                            {{--<img src="{{url('uploads/images',optional(auth()->user())->image)}}" class="img rounded-circle" width="60px">--}}
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="{{route('logout')}}" class="nav-link js-scroll-trigger">
                            Logout
                        </a>
                    </li>
                @endauth
                @guest()
                    <li class="nav-item">
                        <a href="{{route('register')}}" class="nav-link js-scroll-trigger">Register</a>
                    </li>
                    <li class="nav-item">
                        <a href="{{route('login')}}" class="nav-link js-scroll-trigger">Login</a>
                    </li>
                @endguest
                <li class="nav-item text-white" style="font-size: 30px">
                    <a href="{{route('carts')}}"> <i class="fas fa-shopping-cart"></i>
                    </a>

                </li>
            </ul>
        </div>
</div>
</nav>