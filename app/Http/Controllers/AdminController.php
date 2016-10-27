<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Intervention\Image\ImageServiceProvider;
use Image;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;
use Session;
use App\Story;
use View;
use Illuminate\Session\Store;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\TagController;
use Illuminate\Http\UploadedFile;

class AdminController extends Controller
{

    /*if ($request->is('admin/*')) {
        //
    }*/
    public function index()
    {
        if (Auth::guest()) {
            return view('auth.admin_login');
        } else {
            $data = DB::table('story_view')
                ->where('is_delete', 0)
                ->get();

            if (!Auth::guest()) {
                foreach ($data as $value) {
                    $story_id = $value->id;
                    $comment_data = DB::table('comment_view')
                        ->where(
                            [
                                ['story_id', '=', $story_id],
                                ['cis_delete', '=', '0'],
                            ])
                        ->get();
                    $value->comments = $comment_data;
                }
            }
            return view('admin_dashboard')->with('data', $data);
            // return view('admin_dashboard');
        }

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
        $rules = array(
            'name' => 'required|max:255',
            'email' => 'required|max:255',
            'password' => 'required|min:6|confirmed',
            'dob' => 'date',
            'phone' => 'number',
            'image_story' => 'image|mimes:jpeg,png,jpg,gif,svg|max:90480',
        );
        $validator = Validator::make(Request::all(), $rules);

        // process the login
        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator);
        } else {
            if ($request->has('name')) {
                $name = $request->input('name');
            } else {
                return Redirect::back()->withErrors(['msg', 'Ragistration failes']);
            }
            if ($request->has('email')) {
                $email = $request->input('email');
            } else {
                return Redirect::back()->withErrors(['msg', 'Ragistration failes']);
            }
            if ($request->has('phone')) {
                $phone = $request->input('phone');
            } else {
                $phone = '';
            }
            if ($request->has('dob')) {
                $dob = $request->input('dob');
            } else {
                $dob = '';
            }
            if ($request->has('gender')) {
                $gender = $request->input('gender');
            } else {
                $gender = '';
            }

            $avaterLocation = -1;
            if ($request->hasFile('avatar')) {

                $img = Image::make($_FILES['avatar']['tmp_name']);// $request->file('avatar');
                $avaterLocation = 'avatar/img_' . $name . '_' . time() . '.jpg';
// resize image
                $img->fit(400, 300);
// save image
                $img->save($avaterLocation);

                DB::table('users')
                    ->insert([
                        'name' => $name,
                        'email' => $email,
                        'phone' => $phone,
                        'dob' => $dob,
                        'gender' => $gender,
                        'avatar' => $avaterLocation,
                        'password' => bcrypt($request->input('password'))]);
                // redirect
                Session::flash('message', 'Successfully created user image');
                return Redirect::to('/admin/');
            } else {
                DB::table('users')
                    ->insert([
                        'name' => $name,
                        'email' => $email,
                        'phone' => $phone,
                        'dob' => $dob,
                        'gender' => $gender,
                        'password' => bcrypt($request->input('password'))]);
                // redirect
                Session::flash('message', 'Successfully created user ');
                return Redirect::to('/admin/users/');
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show_admin()
    {
        $users = DB::table('users')
            ->where('is_admin', 1)
            ->paginate(15);

        return view('admin_show', ['users' => $users]);
    }

    public function show_users()
    {
        $users = DB::table('users')
            ->where([['is_admin', 0],['block',0]])
            ->paginate(15);

        return view('admin_user_show', ['users' => $users]);
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        $users = DB::table('users')
            ->where('id', $id)->first();
        print_r($users);


        return view('admin_edit', ['users' => $users]);

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
        $rules = array(
            'name' => 'required|max:255',
            'email' => 'required|max:255',
            'password' => 'required|min:6|confirmed',
            'dob' => 'date',
            'phone' => 'number',
            'image_story' => 'image|mimes:jpeg,png,jpg,gif,svg|max:90480',
        );
        $validator = Validator::make(Request::all(), $rules);

        // process the login
        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator);
        } else {
            if ($request->has('name')) {
                $name = $request->input('name');
            } else {
                return Redirect::back()->withErrors(['msg', 'Ragistration failes']);
            }
            if ($request->has('email')) {
                $email = $request->input('email');
            } else {
                return Redirect::back()->withErrors(['msg', 'Ragistration failes']);
            }
            if ($request->has('phone')) {
                $phone = $request->input('phone');
            } else {
                $phone = '';
            }
            if ($request->has('dob')) {
                $dob = $request->input('dob');
            } else {
                $dob = '';
            }
            if ($request->has('gender')) {
                $gender = $request->input('gender');
            } else {
                $gender = '';
            }

            if ($request->has('id')) {
                $user_id = $request->input('id');
            } else {
                return Redirect::back()->withErrors(['msg', 'Update failes']);
            }
            $avaterLocation = -1;
            if ($request->hasFile('avatar')) {

                $img = Image::make($_FILES['avatar']['tmp_name']);// $request->file('avatar');
                $avaterLocation = 'avatar/img_' . $user_id . '_' . time() . '.jpg';

// resize image

                $img->fit(400, 300);
// save image
                $img->save($avaterLocation);
                if ($request->has('id')) {
                    $dob = $request->input('dob');
                } else {
                    $dob = '';
                }
                DB::table('users')
                    ->where('id', $user_id)
                    ->update([
                        'name' => $request->input('name'),
                        'email' => $request->input('email'),
                        'phone' => $request->input('phone'),
                        'dob' => $request->input('dob'),
                        'gender' => $request->input('gender'),
                        'avatar' => $avaterLocation,
                        'password' => bcrypt($request->input('password'))]);
                // redirect
                Session::flash('message', 'Successfully created user image');
                return Redirect::to('/admin/users/');
            } else {
                DB::table('users')
                    ->where('id', $user_id)
                    ->update([
                        'name' => $request->input('name'),
                        'email' => $request->input('email'),
                        'phone' => $request->input('phone'),
                        'dob' => $request->input('dob'),
                        'gender' => $request->input('gender'),
                        'password' => bcrypt($request->input('password'))]);
                // redirect
                Session::flash('message', 'Successfully created user ');
                return Redirect::to('/admin/users/');
            }

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

    }

public function block($id)
{
    $user_id = Auth::user()->id;

    DB::table('users')
        ->where('id', $id)
        ->update(['block' => 1,
            'update_by' => $user_id,
            'updated_at' => date('Y-m-d H:i:s')]);
    return Redirect::to('/admin/');
}
}
