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
                    </div>
                </div>
        </div>
        @endforeach
        <div class="col-lg-12 col-md-12">
            {{ $data->links() }}
        </div>

    </div>
@endsection
