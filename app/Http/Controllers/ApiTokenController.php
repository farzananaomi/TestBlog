<?php

namespace App\Http\Controllers;

use Intervention\Image\ImageServiceProvider;
use Image;
use League\Flysystem\Exception;
use Session;
use App\Story;
use Illuminate\Support\Facades\Log;
use Illuminate\Session\Store;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use App\Comment;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Hash;
use DateTime;

class ApiTokenController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */


    public function register()
    {
        Validator::extend('MustBeOlderThan13Years', function ($attribute, $value, $parameters) {
            $minAge = (!empty($parameters)) ? (int)$parameters[0] : 13;
            return (new DateTime)->diff(new DateTime($value))->y >= $minAge;
        });
        $rules = array(
            'name' => 'required|max:255',
            'email' => 'required|max:255|unique:users',
            'password' => 'required|min:6',
            'dob' => 'required|date|MustBeOlderThan13Years',
            'avatar' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:90480',

        );
        $validator = Validator::make(Request::all(), $rules);

        // process the Registration
        if ($validator->fails()) {
            return response()->json([
                'code' => '400',
                'context' => 'register',
                'app_message' => 'registration failed',
                'user_message' => 'Failed to register your account.',
                'validation' => $validator->messages(),
            ], 400);
        } else {
            $avaterLocation = 'avatar/' . str_replace(" ", "_", Request::get('name')) . '_' . time() . '.jpg';
            if (isset($_FILES['avatar']['tmp_name'])) {
                try {
                    $img = Image::make($_FILES['avatar']['tmp_name']);

// resize image
                    $img->fit(300, 300);
// save image
                    $img->save($avaterLocation);
                } catch (Exception $e) {
                    return response()->json([
                        'code' => '500',
                        'context' => 'register',
                        'app_message' => 'register went wrong',
                        'user_message' => 'Something went wrong!! Please try again.',
                        'Error_message' => $e

                    ], 500);
                }

            }
            try {

                DB::table('users')
                    ->insert([
                        'name' => Request::get('name'),
                        'email' => Request::get('email'),
                        'avatar' => $avaterLocation,
                        'phone' => Request::get('phone'),
                        'dob' => Request::get('dob'),
                        'gender' => Request::get('gender'),
                        'password' => bcrypt(Request::get('password'))]);

            } catch (Exception $e) {
                return response()->json([
                    'code' => '500',
                    'context' => 'register',
                    'app_message' => 'register went wrong',
                    'user_message' => 'Something went wrong!! Please try again.',
                    'Error_message' => $e

                ], 500);
            }

            return response()->json([
                'code' => '200',
                'context' => 'register',
                'app_message' => 'registration successful',
                'user_message' => 'Thank you  ' . Request::get('name') . ', your account has been created
successfully.',

            ], 200);
        }
    }

    public function login()
    {
        $rules = array(
            'email' => 'required|max:255',
            'password' => 'required|min:6',

        );
        $validator = Validator::make(Request::all(), $rules);

        // process the login
        if ($validator->fails()) {
            return response()->json([
                'code' => '500',
                'context' => 'login',
                'app_message' => 'login went wrong',
                'user_message' => 'Something went wrong!! Please try again.',
                'validation' => $validator->messages(),
            ], 500);
        } else {
            $data = DB::table('users')
                ->where('email', Request::get('email'))
                ->first();
            if ($data) {
                if (Hash::check(Request::get('password'), $data->password)) {
                    $api_token = $data->id . $data->email . time();
                    $api_token = sha1($api_token);
                    DB::table('users')
                        ->where('id', $data->id)
                        ->update(['api_token' => $api_token . $api_token,
                        ]);
                    return response()->json([
                        'code' => '200',
                        'context' => 'login',
                        'app_message' => 'login successful',
                        'user_message' => 'Login Successful.',
                        'api_token' => $api_token . $api_token,/*.Request::get('password')."|".$data->password*/
                    ], 200);
                } else {
                    return response()->json([
                        'code' => '401',
                        'context' => 'login',
                        'app_message' => 'password mismatch',
                        'user_message' => 'Password did not validate. Try again.',
                    ], 401);
                }


            } else {
                return response()->json([
                    'code' => '403',
                    'context' => 'login',
                    'app_message' => 'email not registered',
                    'user_message' => 'Email not registered with us. Please create an account.',
                ], 403);
            }

        }

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function check_api_token($token)
    {
        // echo $token;
        $data = DB::table('users')
            ->where('api_token', $token)
            ->get();
        if (count($data) >= 1) {

            foreach ($data as $val) {
                return $val->id;
                break;
            }
        } else {

            return 0;
        }


    }

    public function stories()
    {
        if (Request::get('api_token')) {
            $user_id = $this->check_api_token(Request::get('api_token'));
            if ($user_id == 0) {
                return response()->json([
                    'code' => '403',
                    'context' => 'stories',
                    'app_message' => 'user not authenticated',
                    'user_message' => 'You are not authorized to perform this request/action.',
                ], 403);

            } else {
                $data = DB::table('stories_view')
                    ->paginate(15);
                foreach ($data as $value) {
                    $story_id = $value->id;
                    $tag_data = DB::table('tags')
                        ->select(DB::raw('GROUP_CONCAT(tag) as tags'))
                        ->where('story_id', $story_id)
                        ->first();
                    $value->tags = explode(",", $tag_data->tags);
                    $section_id = $value->section;
                    $value->section = DB::table('sections')
                        ->select(DB::raw('id  as id, section_name as name'))
                        ->where('id', $section_id)
                        ->first();
                }
                return response()->json($data, 200);
            }

        } else {
            return response()->json([
                'code' => '500',
                'context' => 'stories',
                'app_message' => 'stories went wrong',
                'user_message' => 'Something went wrong!! Please try again.',

            ], 500);
        }
    }

    public function stories_id($id)
    {
        if (Request::get('api_token')) {
            $user_id = $this->check_api_token(Request::get('api_token'));
            if ($user_id == 0) {
                return response()->json([
                    'code' => '403',
                    'context' => 'Specific story',
                    'app_message' => 'user not authenticated',
                    'user_message' => 'You are not authorized to perform this request/action.',
                ], 403);

            } else {
                $data = DB::table('stories_view')
                    ->where('id', $id)
                    ->first();
                if (count($data) >= 1) {
                    $tag_data = DB::table('tags')
                        ->select(DB::raw('GROUP_CONCAT(tag) as tags'))
                        ->where('story_id', $id)
                        ->first();
                    $data->tags = explode(",", $tag_data->tags);
                    $section_id = $data->section;
                    $data->section = DB::table('sections')
                        ->select(DB::raw('id  as id, section_name as name'))
                        ->where('id', $section_id)
                        ->first();

                    return response()->json($data, 200);
                } else {
                    return response()->json([
                        'code' => '500',
                        'context' => 'Specific story',
                        'app_message' => 'Specific story went wrong',
                        'user_message' => 'Something went wrong!! Please try again.',

                    ], 500);
                }
            }

        } else {
            return response()->json([
                'code' => '500',
                'context' => 'Specific story',
                'app_message' => 'Specific story went wrong',
                'user_message' => 'Something went wrong!! Please try again.',

            ], 500);
        }
    }

    public function stories_share()
    {
        if (Request::get('api_token')) {
            $user_id = $this->check_api_token(Request::get('api_token'));
            if ($user_id == 0) {
                return response()->json([
                    'code' => '403',
                    'context' => 'Specific story',
                    'app_message' => 'user not authenticated',
                    'user_message' => 'You are not authorized to perform this request/action.',
                ], 403);

            } else {
                $rules = array(
                    'title' => 'required|max:255',
                    'body' => 'required',
                    'section' => 'required|max:255',
                    'image_caption' => 'max:255',
                    'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:90480',
                    'tags' => 'required|max:225'
                );
                $validator = Validator::make(Request::all(), $rules);

                // process the Registration
                if ($validator->fails()) {
                    return response()->json([
                        'code' => '500',
                        'context' => 'stories',
                        'app_message' => 'stories went wrong',
                        'user_message' => 'Something went wrong!! Please try again.',
                        'validation' => $validator->messages(),
                    ], 400);
                } else {
                    $image_story = 'story/img_' . $user_id . '_' . time() . '.jpg';
                    if (isset($_FILES['image']['tmp_name'])) {
                        try {


                            $img = Image::make($_FILES['image']['tmp_name']);
// resize image
                            $img->fit(400, 300);
// save image
                            $img->save($image_story);
                        } catch (Exception $e) {
                            return response()->json([
                                'code' => '500',
                                'context' => 'stories',
                                'app_message' => 'stories went wrong',
                                'user_message' => 'Something went wrong!! Please try again.',
                                'Error_message' => $e

                            ], 500);
                        }

                    }
                    try {
                        /*
                                                DB::table('storys')
                                                    ->insert(['title' => Request::get('title'),
                                                        'story_body' => Request::get('body'),
                                                        'section' => Request::get('section'),
                                                        'image_caption' => Request::get('image_caption'),
                                                        'update_by' => $user_id,
                                                        'updated_at' => date('Y-m-d H:i:s'),
                                                        'image_story' => $image_story,
                                                        'user_id'=>$user_id,
                                                        'created_at'=>date('Y-m-d H:i:s')
                                                    ]);*/
                        $story = new Story;
                        $story->title = Request::get('title');
                        $story->story_body = Request::get('body');
                        $story->section = Request::get('section');
                        $story->image_caption = Request::get('image_caption');
                        $story->image_story = $image_story;
                        $story->update_by = $user_id;
                        $story->user_id = $user_id;
                        $story->save();
                        $tag_data = Request::get('tags');
                        foreach ($tag_data as $val) {
                            (new TagController)->create($val, $story->id);
                        }
                    } catch (Exception $e) {
                        return response()->json([
                            'code' => '500',
                            'context' => 'stories',
                            'app_message' => 'stories went wrong',
                            'user_message' => 'Something went wrong!! Please try again.',
                            'Error_message' => $e

                        ], 500);
                    }

                    return response()->json([
                        'code' => '200',
                        'context' => 'stories',
                        'app_message' => 'story posted successfully',
                        'user_message' => 'Your Story has been successfully published.',

                    ], 200);
                }
            }
        } else {
            return response()->json([
                'code' => '500',
                'context' => 'stories',
                'app_message' => 'stories went wrong',
                'user_message' => 'Something went wrong!! Please try again.',

            ], 500);
        }
    }

    public
    function comments($id)
    {
        if (Request::get('api_token')) {
            $user_id = $this->check_api_token(Request::get('api_token'));
            if ($user_id == 0) {
                return response()->json([
                    'code' => '403',
                    'context' => 'Specific story',
                    'app_message' => 'user not authenticated',
                    'user_message' => 'You are not authorized to perform this request/action.',
                ], 403);

            } else {
                $data = DB::table('comments')
                    ->select(DB::raw('id, comment as body,user_id as user'))
                    ->where('story_id', $id)
                    ->paginate(15);
                if (count($data) >= 1) {
                    foreach ($data as $value) {
                        $user_id = $value->user;
                        $user_data = DB::table('users')
                            ->select(DB::raw('id, `name`, CONCAT("' . url('/') . '" ,"/", avatar) as avatar'))
                            ->where('id', $user_id)
                            ->first();
                        $value->user = $user_data;

                    }
                    return response()->json($data, 200);
                } else {
                    return response()->json([
                        'code' => '500',
                        'context' => 'Specific story',
                        'app_message' => 'Specific story went wrong',
                        'user_message' => 'Something went wrong!! Please try again. Data not found',

                    ], 500);
                }
            }

        } else {
            return response()->json([
                'code' => '500',
                'context' => 'Specific story',
                'app_message' => 'Specific story went wrong',
                'user_message' => 'Something went wrong!! Please try again.',

            ], 500);
        }
    }


    public function comments_share($story_id)
    {
        if (Request::get('api_token')) {
            $user_id = $this->check_api_token(Request::get('api_token'));
            if ($user_id == 0) {
                return response()->json([
                    'code' => '403',
                    'context' => 'stories',
                    'app_message' => 'user not authenticated',
                    'user_message' => 'You are not authorized to perform this request/action.',
                ], 403);

            } else {
                $rules = array(
                    'id' => 'required|max:255',
                    'body' => 'required',
                );
                $validator = Validator::make(Request::all(), $rules);

                // process the Registration
                if ($validator->fails()) {
                    return response()->json([
                        'code' => '500',
                        'context' => 'stories',
                        'app_message' => 'stories went wrong',
                        'user_message' => 'Something went wrong!! Please try again.',
                        'validation' => $validator->messages(),
                    ], 500);
                } else {
                    try {
                        $Objcomment = new Comment;
                        $Objcomment->story_id = Request::get('id');
                        $Objcomment->user_id = $user_id;
                        $Objcomment->comment = Request::get('body');
                        $Objcomment->update_by = $user_id;
                        $Objcomment->is_delete = 0;
                        $Objcomment->save();
                    } catch (Exception $e) {
                        return response()->json([
                            'code' => '500',
                            'context' => 'stories',
                            'app_message' => 'stories went wrong',
                            'user_message' => 'Something went wrong!! Please try again.',
                            'Error_message' => $e

                        ], 500);
                    }

                    return response()->json([
                        'code' => '200',
                        'context' => 'stories',
                        'app_message' => 'story comment posted successfully',
                        'user_message' => 'Your comment has been successfully published.',

                    ], 200);
                }
            }
        } else {
            return response()->json([
                'code' => '200',
                'context' => 'stories',
                'app_message' => 'story posted successfully',
                'user_message' => 'Your Story has been successfully published.',

            ], 200);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public
    function sections()
    {
        if (Request::get('api_token')) {
            $user_id = $this->check_api_token(Request::get('api_token'));
            if ($user_id == 0) {
                return response()->json([
                    'code' => '403',
                    'context' => 'stories',
                    'app_message' => 'user not authenticated',
                    'user_message' => 'You are not authorized to perform this request/action.',
                ], 403);

            } else {
                $data = DB::table('sections')
                    ->select(DB::raw('id  as id, section_name as name'))
                    ->get();

                return response()->json($data, 200);
            }

        } else {
            return response()->json([
                'code' => '500',
                'context' => 'stories',
                'app_message' => 'stories went wrong',
                'user_message' => 'Something went wrong!! Please try again.',

            ], 500);
        }
    }


    public
    function profile()
    {
        if (Request::get('api_token')) {
            $user_id = $this->check_api_token(Request::get('api_token'));
            if ($user_id == 0) {
                return response()->json([
                    'code' => '403',
                    'context' => 'stories',
                    'app_message' => 'user not authenticated',
                    'user_message' => 'You are not authorized to perform this request/action.',
                ], 403);

            } else {
                $data = DB::table('users')
                    ->select(DB::raw('id  as id, `name`, email,dob,phone,gender,CONCAT("' . url('/') . '" ,"/", avatar) as avatar'))
                    ->where('id', $user_id)
                    ->get();
                return response()->json($data, 200);
            }

        } else {
            return response()->json([
                'code' => '500',
                'context' => 'stories',
                'app_message' => 'stories went wrong',
                'user_message' => 'Something went wrong!! Please try again.',

            ], 500);
        }
    }

}
