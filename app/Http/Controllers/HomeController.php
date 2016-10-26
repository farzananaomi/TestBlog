<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Story;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //  $data=Story::all();
        $data = DB::table('story_view')
            ->where('is_delete',0)
            ->get();


        foreach ($data as $value) {
            $story_id = $value->id;
            $comment_data = DB::table('comment_view')
                ->where('story_id',$story_id)
                ->get();
            $value->comments=$comment_data;
        }
        return view('home')->with('data', $data);

    }
}
