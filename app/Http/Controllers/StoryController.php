<?php

namespace App\Http\Controllers;


use Intervention\Image\ImageServiceProvider;
use Image;
use Session;
use App\Story;
use View;
use Illuminate\Support\Facades\Log;
use Illuminate\Session\Store;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use App\Http\Controllers\TagController;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;

class StoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $redirectTo = '/index';

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        //
        return view('profile');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $rules = array(
            'title' => 'required|max:255',
            'story_body' => 'required',
            'section' => 'required|max:255',
            'image_caption' => 'required|max:255',
            'image_story' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:90480',
        );
        $validator = Validator::make(Request::all(), $rules);

        // process the login
        if ($validator->fails()) {
            return Redirect::to('profile')->withErrors($validator);
        } else {
            $user_id = Auth::user()->id;
            $image_story = 'story/img_' . $user_id . '_' . time() . '.jpg';
            $img = Image::make($_FILES['image_story']['tmp_name']);
// resize image
            $img->fit(400, 300);
// save image
            $img->save($image_story);
            // store
            $story = new Story;
            $story->title = Request::get('title');
            $story->story_body = Request::get('story_body');
            $story->section = Request::get('section');
            $story->image_caption = Request::get('image_caption');
            $story->image_story = $image_story;
            $story->update_by = $user_id;
            $story->user_id = $user_id;
            $story->save();
            $tag_data = Request::get('tags');
            $tag_data = explode(",", $tag_data);
            foreach ($tag_data as $val) {
                (new TagController)->create($val, $story->id);

            }
            // redirect
            Session::flash('message', 'Successfully created ');
            return Redirect::to('profile');
        }
    }

    /**
     * Store a newly created resource in storage.
     *if (Auth::check()) {
     * // The user is logged in...
     * }
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store()
    {


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
        $story = DB::table('story_view')
            ->where('id', $id)
            ->limit(1)
            ->get();
        //  print_r($story);
        return view('edit_story')->with('story', $story);
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
        $user_id = Auth::user()->id;
        $rules = array(
            'title' => 'required|max:255',
            'story_body' => 'required',
            'section' => 'required|max:255',
            'image_caption' => 'required|max:255',
            'image_story' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:90480',
        );
        $validator = Validator::make(Request::all(), $rules);

        // process the login
        if ($validator->fails()) {
            $story = DB::table('story_view')
                ->where('id', $id)
                ->limit(1)
                ->get();
            return Redirect::to('edit_story')->withErrors($validator)->with('story', $story);
        } else {


            if (isset($_FILES['image_story'])) {
                $image_story = 'story/img_' . $user_id . '_' . time() . '.jpg';
                $img = Image::make($_FILES['image_story']['tmp_name']);
// resize image
                $img->fit(400, 300);
// save image
                $img->save($image_story);
                DB::table('storys')
                    ->where('id', $id)
                    ->update(['title' => Request::get('title'),
                        'story_body' => Request::get('story_body'),
                        'section' => Request::get('section'),
                        'image_caption' => Request::get('image_caption'),
                        'update_by' => $user_id,
                        'updated_at' => date('Y-m-d H:i:s'),
                        'image_story' => $image_story
                    ]);
            } else {
                DB::table('storys')
                    ->where('id', $id)
                    ->update(['title' => Request::get('title'),
                        'story_body' => Request::get('story_body'),
                        'section' => Request::get('section'),
                        'image_caption' => Request::get('image_caption'),
                        'update_by' => $user_id,
                        'updated_at' => date('Y-m-d H:i:s')]);
            }
            $tag_data = Request::get('tags');
            $tag_data = explode(",", $tag_data);
            (new TagController)->destroy($id);
            foreach ($tag_data as $val) {
                (new TagController)->create($val, $id);
            }
            // redirect
            Session::flash('message', 'Successfully created ');
            return Redirect::to('/');
        }


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user_id = Auth::user()->id;

        DB::table('storys')
            ->where('id', $id)
            ->update(['is_delete' => 1,
                'update_by' => $user_id,
                'updated_at' => date('Y-m-d H:i:s')]);
        return Redirect::to('/');
    }

    public function block($id)
    {
        $user_id = Auth::user()->id;

        DB::table('storys')
            ->where('id', $id)
            ->update(['blocked' => 1,
                'update_by' => $user_id,
                'updated_at' => date('Y-m-d H:i:s')]);
        return Redirect::to('/');
    }
}
