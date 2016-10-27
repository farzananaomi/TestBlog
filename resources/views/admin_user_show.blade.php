@extends('layouts.admin_app')

@section('content')
    <div class="container">
        <div class="col-md-12 col-lg-12 ">
            <div class="panel panel-default">

                <div class="panel-heading"><h1> Admin User</h1></div>
                <div class="panel-body">

                    <h4><a href="{{url('/admin/add/')}}"> <i class="fa fa-plus " aria-hidden="true" title="Add"></i> Add
                            new admin click here</a></h4>
                    <table class="table">

                        <thead>
                        <tr>
                            <th>
                                Name
                            </th>
                            <th>
                                Username
                            </th>
                            <th>
                                created_at
                            </th>
                            <th>
                                Action
                            </th>
                        </tr>
                        </thead>
                        <tbody>        @foreach ($users as $user)
                            <tr>
                                <th>
                                    {{ $user->name }}
                                </th>
                                <th>
                                    {{ $user->email }}
                                </th>
                                <th>
                                    {{ $user->created_at }}
                                </th>
                                <th>
                                    <a href="{{url('/admin/block/'.$user->id)}}"> <i class="fa fa-ban fa-2x "
                                                                                      aria-hidden="true"
                                                                                      title="block"></i></a>

                                </th>
                            </tr>
                        </tbody>
                        @endforeach

                    </table>
                    {{ $users->links() }}
                </div>
            </div>
        </div>
    </div>


@endsection
