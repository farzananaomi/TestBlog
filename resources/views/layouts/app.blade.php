<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    <link href="/css/app.css" rel="stylesheet">
    <link href="/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- Scripts -->
    <script>
        window.Laravel =<?php echo json_encode([
                'csrfToken' => csrf_token(),
        ]); ?>
    </script>
</head>
<body>
<div id="app">
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div class="navbar-header">

                <!-- Collapsed Hamburger -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#app-navbar-collapse">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Branding Image -->
                <a class="navbar-brand" href="{{ url('/') }}">
                    {{ config('app.name', 'Laravel') }}
                </a>
            </div>

            <div class="collapse navbar-collapse" id="app-navbar-collapse">
                <!-- Left Side Of Navbar -->
                <ul class="nav navbar-nav">
                    <li><a href="{{url('/')}}">Home</a></li>
                    <li><a href="{{url('/profile')}}">Post Story</a></li>

                </ul>

                <!-- Right Side Of Navbar -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- Authentication Links -->
                    @if (Auth::guest())
                        <form class="form-inline" role="form" method="POST" action="{{ url('/login') }}">
                            {{ csrf_field() }}
                            <li>
                                <div class="row">
                                    <div class="col-md-2 col-lg-2" style="margin-right: 5px;">
                                        <input id="email" type="email" class="form-inline" name="email"
                                               value="{{ old('email') }}" required
                                               autofocus placeholder="Username/email"
                                               style="margin-top: 8px;"> @if ($errors->has('email'))
                                            <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                        @endif
                                    </div>
                                    <div class="col-lg-1 col-md-1"></div>
                                    <div class="col-lg-2 col-lg-2" style="margin-left: 5px; margin-right: 5px">
                                        <input id="password" type="password" class="form-inline" name="password"
                                               placeholder="Password"
                                               required style="margin-top: 8px;">
                                        @if ($errors->has('password'))
                                            <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                        @endif
                                        <p><a class="btn btn-link" href="{{ url('/password/reset') }}"
                                              style="font-size: 13px;">
                                                Forgot Your Password?
                                            </a></p>
                                    </div>
                                    <div class="col-lg-1 col-md-1"></div>
                                    <div class="col-lg-2 col-md-2">
                                        <button type="submit" class="btn btn-primary"
                                                style="  padding: 2px 9px; margin-top: 8px;">
                                            Login
                                        </button>
                                    </div>
                                    {{--  <div class="col-lg-1 col-md-1"></div>--}}
                                    <div class="col-lg-2 col-md-2">
                                        <a href="{{ url('/register') }}" class="btn btn-primary"
                                           style="  padding: 2px 9px; margin-top: 8px;">Register</a>
                                    </div>
                                </div>
                            </li>
                        </form>
                        {{--<a href="{{ url('/login') }}">Login</a>--}}

                    @else
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-expanded="false">
                                <img src="{{url(Auth::user()->avatar)}}" style="border-radius: 50%; width: 50px;"
                                     alt=" "/> {{ Auth::user()->name }} <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="{{url('/user_edit')}}"> <i class="fa fa-pencil-square-o fa-2x "
                                                                        aria-hidden="true" title="Edit"></i></a>
                                </li>
                                <li>
                                    <a href="{{ url('/logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        Logout
                                    </a>

                                    <form id="logout-form" action="{{ url('/logout') }}" method="POST"
                                          style="display: none;">
                                        {{ csrf_field() }}
                                    </form>
                                </li>
                            </ul>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
    </nav>
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <form class="" role="form" method="POST" action="{{ url('/search') }}">
                    <div class="col-lg-6 col-md-6">
                        {{ csrf_field() }}
                        <input id="search" type="text" class="form-control" name="search"
                               value="{{ old('search') }}" required
                               autofocus placeholder="Search Anythig "
                               style="margin-top: 8px;"> @if ($errors->has('search'))
                            <span class="help-block">
                                        <strong>{{ $errors->first('search') }}</strong>
                                    </span>
                        @endif
                    </div>
                    <div class="col-lg-1 col-md-1"></div>

                    <div class="col-lg-2 col-md-2">
                        <button type="submit" class="btn btn-primary" style="">
                            Search
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    @yield('content')
</div>

<!-- Scripts -->
<script src="/js/app.js"></script>
</body>
</html>
