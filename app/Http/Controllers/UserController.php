<?php
/**
 * Created by PhpStorm.
 * User: Farzana Naomi
 * Date: 10/26/2016
 * Time: 2:16 AM
 */

namespace App\Http\Controllers;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Intervention\Image\ImageServiceProvider;
use Image;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;
use Session;
use App\Story;
use View;
use Illuminate\Session\Store;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\TagController;


class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');

    }
    public function edit($id='')
    {

        return view('user_edit');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $user_id = Auth::user()->id;
        $rules = array(
                'name' => 'required|max:255',
                'email' => 'required|email|max:255',
                'password' => 'required|min:6|confirmed',
                'dob' => 'required|date',
                'avatar' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:90480'

        );
        $validator = Validator::make(Request::all(), $rules);

        // process the login
        if ($validator->fails()) {

            return Redirect::to('user_edit')->withErrors($validator);
        } else {


                $avaterLocation = 'avatar/' . str_replace(" ","_",Request::get('name')) . '_' . time() . '.jpg';
                $img = Image::make($_FILES['avatar']['tmp_name']);

// resize image
                $img->fit(300, 300);
// save image
                $img->save($avaterLocation);

                DB::table('users')
                    ->where('id', $user_id)
                    ->update([
                        'name' => Request::get('name'),
                        'email' => Request::get('email'),
                        'avatar' => $avaterLocation,
                        'phone' => Request::get('phone'),
                        'dob' => Request::get('dob'),
                        'gender' => Request::get('gender'),
                        'password' => bcrypt(Request::get('password'))]);
            // redirect
            Session::flash('message', 'Successfully created user ');
            return Redirect::to('/');
        }


    }
}