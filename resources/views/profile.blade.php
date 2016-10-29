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
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1 class="panel-title">
                            Shared Stories By Me  !!
                        </h1>
                    </div>
                </div>

                @foreach($data as $row)
                    @if($row->blocked == 0)
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="row">
                                            <div class="col-md-12 col-lg-12">
                                                {{--  {{$row->id}} ||||||| {{$row->user_id}}--}}
                                                <img src="{{$row->avatar}}" alt=" "
                                                     style="border-radius: 50%; width: 50px;">
                                                <b> {{$row->name}}</b> write a story on {{$row->created_at}}.
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 col-lg-4">
                                                {{--  {{$row->id}} ||||||| {{$row->user_id}}--}}
                                                <b>Title of Story</b>
                                            </div>
                                            <div class="col-md-8 col-lg-8">
                                                {{$row->title}}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 col-lg-4">
                                                {{--  {{$row->id}} ||||||| {{$row->user_id}}--}}
                                                <b>Story Details</b>
                                            </div>
                                            <div class="col-md-8 col-lg-8">
                                                {{$row->story_body}}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 col-lg-4">
                                                {{--  {{$row->id}} ||||||| {{$row->user_id}}--}}
                                                <b>Section Of Story </b>
                                            </div>
                                            <div class="col-md-8 col-lg-8">
                                                {{$row->section}}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 col-lg-4">
                                                {{--  {{$row->id}} ||||||| {{$row->user_id}}--}}
                                                <b>Tag Of Story </b>
                                            </div>
                                            <div class="col-md-8 col-lg-8">
                                                {{$row->tags}}
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="row">
                                            <div class="col-md-8 col-lg-8">
                                                <img src="{{$row->image_story}}" alt="Sorry Image Not Found"
                                                     style="height: 300px;">
                                            </div>
                                            @if(!Auth::guest())
                                                @if(Auth::user()->id==$row->user_id)
                                                    <div class="col-lg-1 col-md-1">
                                                        <a href="{{ url('/sedit/'.$row->id) }}" class="btn btn-info">
                                                            <i class="fa fa-pencil-square-o fa-2x " aria-hidden="true"
                                                               title="Edit"></i>
                                                        </a>
                                                    </div>
                                                @endif
                                                @if(Auth::user()->id==$row->user_id ||Auth::user()->is_admin)
                                                    <div class="col-lg-1 col-md-1">
                                                        <a href="{{ url('/sdelete/'.$row->id) }}" class="btn btn-info"
                                                           style="background-color: red">
                                                            <i class="fa fa-trash-o fa-2x " aria-hidden="true"
                                                               title="Delete"></i>
                                                        </a>
                                                    </div>
                                                @endif
                                                @if(Auth::user()->is_admin)
                                                    <div class="col-lg-1 col-md-1">

                                                        <a href="{{ url('/sblock/'.$row->id) }}" class="btn btn-danger">
                                                            <i class="fa fa-ban fa-2x " aria-hidden="true"
                                                               title="Block"></i>
                                                        </a>
                                                    </div>
                                                @endif
                                            @endif
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 col-lg-3">
                                                {{--  {{$row->id}} ||||||| {{$row->user_id}}--}}
                                                <b>Image Caption : </b>
                                            </div>
                                            <div class="col-md-8 col-lg-8">
                                                {{$row->image_caption}}
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                @if (!Auth::guest())
                                    @foreach($row->comments as $cdata)
                                        <div class="row">
                                            <div class="col-lg-2 col-md-2"></div>
                                            <div class="col-md-1 col-lg-1">
                                                {{--  {{$row->id}} ||||||| {{$row->user_id}}--}}
                                                <img src="{{$cdata->cavatar}}" alt=" "
                                                     style="border-radius: 50%; width: 50px;">
                                            </div>


                                            <div class="col-md-6 col-lg-6">
                                                <div class="row">
                                                    <b> {{$cdata->cname}}</b> {{$cdata->comment}}
                                                </div>
                                                <div class="row">
                                                    Commented on <b> {{$cdata->ccreated_at}}</b>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2"></div>
                                        </div>
                                    @endforeach

                                    <div class="row">
                                        <form class="form-inline" role="form" method="POST"
                                              action="{{ url('/comment/'.$row->id) }}">
                                            {{ csrf_field() }}
                                            <div class="col-lg-2 col-md-2"></div>
                                            <div class="col-md-1 col-lg-1">
                                                {{--  {{$row->id}} ||||||| {{$row->user_id}}--}}
                                                <img src="{{$row->avatar}}" alt=" "
                                                     style="border-radius: 50%; width: 50px; margin-left: 12px;">
                                            </div>
                                            <div class="col-md-4 col-lg-4 ">
                                    <textarea id="comment" name="comment" cols="50" rows="2" class="form-control"
                                              autofocus>{{ old('comment') }}</textarea>

                                                @if ($errors->has('comment'))
                                                    <span class="help-block">
                                        <strong>{{ $errors->first('comment') }}</strong>
                                    </span>
                                                @endif
                                            </div>
                                            <div class="col-md-2 col-lg-2">
                                                <button type="submit" class="btn btn-primary">
                                                    Comment
                                                </button>
                                            </div>


                                        </form>
                                    </div>
                                @endif
                            </div>
                        </div>
                    @endif
                @endforeach
                <div class="col-lg-12 col-md-12">
                    {{ $data->links() }}
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
                        $('#section').prop('onclick', null);
                    }
                });
            }

        </script>
@endsection
