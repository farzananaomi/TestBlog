<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Story;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\AdminController;
use League\Flysystem\Exception;

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

        $data = DB::table('story_view')
            ->where('is_delete', 0)
            ->paginate(15);

        if (Auth::guest()) {
            //print_r($data);
            return view('home_before')->with('data', $data);
        } else {
            if (Auth::user()->is_admin) {
                return (new AdminController)->index();
            } else {
                foreach ($data as $value) {
                    $story_id = $value->id;
                    $comment_data = DB::table('comment_view')
                        ->where([
                            ['story_id', '=', $story_id],
                            ['cis_delete', '=', '0'],
                        ])
                        ->get();
                    $value->comments = $comment_data;
                }

                return view('home')->with('data', $data);
            }
        }


    }

    public function get_section_list()
    {
        $data = DB::table('sections')
            ->orderBy('section_name', 'asc')
            ->get();
        $i = 0;
        foreach ($data as $value) {
            $select_list[$i++][$value->id] = $value->section_name;

        }
        return response()->json($select_list);
    }


}
