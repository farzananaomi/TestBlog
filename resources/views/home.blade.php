@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-12">
                @if(Session::has('message'))
                    {{Session::get('message')}}
                @endif
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
@endsection
