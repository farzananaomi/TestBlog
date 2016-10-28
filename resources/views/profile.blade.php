@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-lg-12">
                @if(Session::has('message'))
                    {{Session::get('message')}}
                @endif
            </div>
            <div class="col-lg-3 col-md-3">
                @if (Auth::guest())
                    <div class="panel panel-default">
                        <div class="panel-heading">Login</div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" method="POST" action="{{ url('/login') }}">
                                {{ csrf_field() }}

                                <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                                    <label for="email" class="col-md-12 col-lg-12 ">E-Mail Address</label>

                                    <div class="col-md-12 col-lg-12">
                                        <input id="email" type="email" class="form-control" name="email"
                                               value="{{ old('email') }}" required autofocus>

                                        @if ($errors->has('email'))
                                            <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                    <label for="password" class="col-md-12 col-lg-12 ">Password</label>

                                    <div class="col-md-12 col-lg-12">
                                        <input id="password" type="password" class="form-control" name="password"
                                               required>

                                        @if ($errors->has('password'))
                                            <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-4">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="remember"> Remember Me
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-8 col-md-offset-4">
                                        <button type="submit" class="btn btn-primary">
                                            Login
                                        </button>

                                        <a class="btn btn-link" href="{{ url('/password/reset') }}">
                                            Forgot Your Password?
                                        </a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                @else
                    <div class="panel panel-default">
                        <div class="page-header text-center">
                            <h2>{{Auth::user()->name}}</h2>
                        </div>
                        <img src="{{url(Auth::user()->avatar)}}" alt="{{Auth::user()->avatar}}"/>

                        <div class="panel-body">

                        </div>
                    </div>
                @endif
            </div>
            <div class="col-lg-9 col-md-9">
                <div class="panel panel-default">


                    <div class="panel-body">
                        @if (!Auth::guest())
                            <form class="form-horizontal" role="form" method="POST" action="{{ url('story2') }}"
                                  enctype="multipart/form-data">
                                {{ csrf_field() }}
                                @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endif
                                <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                                    <label for="title" class="col-md-4 control-label">Title</label>

                                    <div class="col-md-6">
                                        <input id="id" type="hidden" class="form-control" name="id"
                                               value="{{ old('title') }}" autofocus>
                                        <input id="title" type="text" class="form-control" name="title"
                                               value="{{ old('title') }}" required autofocus>

                                        @if ($errors->has('title'))
                                            <span class="help-block">
                                        <strong>{{ $errors->first('title') }}</strong>
                                    </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group{{ $errors->has('story_body') ? ' has-error' : '' }}">
                                    <label for="story_body" class="col-md-4 control-label">Story</label>

                                    <div class="col-md-6">
                                        <textarea id="story_body" name="story_body" cols="50" rows="2"
                                                  class="form-control" required>{{ old('story_body') }}</textarea>

                                        @if ($errors->has('story_body'))
                                            <span class="help-block">
                                        <strong>{{ $errors->first('story_body') }}</strong>
                                    </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group{{ $errors->has('section') ? ' has-error' : '' }}">
                                    <label for="dob" class="col-md-4 control-label">Section</label>

                                    <div class="col-md-6">


                                        <select id="section" name="section" class="form-control"
                                                onclick="getDroupDownListSection();">
                                            <option value="1">Select a Section</option>

                                        </select>

                                        @if ($errors->has('section'))
                                            <span class="help-block">
                                        <strong>{{ $errors->first('section') }}</strong>
                                    </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group{{ $errors->has('tags') ? ' has-error' : '' }}">
                                    <label for="tags" class="col-md-4 control-label">Multiple Tags</label>

                                    <div class="col-md-6">
                                        <input id="tags" type="text" class="form-control" name="tags"
                                               value="{{ old('tags') }}"
                                               autofocus>

                                        @if ($errors->has('tags'))
                                            <span class="help-block">
                                        <strong>{{ $errors->first('tags') }}</strong>
                                    </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group{{ $errors->has('image_story') ? ' has-error' : '' }}">
                                    <label for="image_story" class="col-md-4 control-label">Story Image</label>

                                    <div class="col-md-6">
                                        <input type="file" name="image_story" id="image_story" class="form-control">

                                        @if ($errors->has('image_story'))
                                            <span class="help-block">
                                        <strong>{{ $errors->first('image_story') }}</strong>
                                    </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group{{ $errors->has('image_caption') ? ' has-error' : '' }}">
                                    <label for="image_caption" class="col-md-4 control-label">Image Caption</label>

                                    <div class="col-md-6">
                                        <input id="image_caption" type="text" class="form-control" name="image_caption"
                                               required>

                                        @if ($errors->has('image_caption'))
                                            <span class="help-block">
                                        <strong>{{ $errors->first('image_caption') }}</strong>
                                    </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-4">
                                        <button type="submit" class="btn btn-primary">
                                            Share Story
                                        </button>
                                    </div>
                                </div>
                            </form>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function getDroupDownListSection() {
            //     alert();
            $.ajax({
                type: "GET",
                url: '{{url('/section')}}',
                data: "",
                success: function (data) {
                    $.each(data, function (key, value) {
                        $.each(value, function (key2, value2) {
                            $('#section').append('<option value=' + key2 + '>' + value2 + '</option>');
                        });
                    });
                    $('#section').prop('onclick',null);
                }
            });
        }

    </script>
@endsection
