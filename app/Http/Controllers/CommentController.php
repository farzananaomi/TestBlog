<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Image;
use Session;
use App\Comment;
use App\Http\Requests;
use Illuminate\Support\Facades\Log;
use Illuminate\Session\Store;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\DB;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth');

    }

    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($story_id, Request $request)
    {
        $user_id = Auth::user()->id;

       // $query = $request->input('comment');

        $Objcomment = new Comment;
        $Objcomment->story_id = $story_id;
        $Objcomment->user_id = $user_id;
        $Objcomment->comment = $request->input('comment');
        $Objcomment->update_by = $user_id;
        $Objcomment->is_delete = 0;
        $Objcomment->save();

        return Redirect::to('/');//(new HomeController)->index();
          //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
       // echo $id;
         DB::table('comments')->where('id',$id)
            ->update(['is_delete'=>1,]);
        return Redirect::back();
    }
}
