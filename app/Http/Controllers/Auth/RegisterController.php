<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Intervention\Image\ImageServiceProvider;
use Image;
use Illuminate\Support\Facades\Log;
use DateTime;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        Validator::extend('MustBeOlderThan13Years', function($attribute, $value, $parameters)
        {
            $minAge = ( ! empty($parameters)) ? (int) $parameters[0] : 13;
            return (new DateTime)->diff(new DateTime($value))->y >= $minAge;
        });
        return Validator::make($data, [
            'name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|min:6|confirmed',
            'dob' => 'required|date|MustBeOlderThan13Years',
            'avatar' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:90480',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array $data
     * @return User
     */
    protected function create(array $data)
    {

        $avaterLocation = 'avatar/' . str_replace(" ", "_", $data['name']) . '_' . time() . '.jpg';
        $img = Image::make($_FILES['avatar']['tmp_name']);

// resize image
        $img->fit(300, 300);
// save image
        $img->save($avaterLocation);
       // $rules = ['dob' => 'olderThan']; // checks for 13 years as a default age
      //  $rules = ['dob' => 'olderThan:15'];
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'avatar' => $avaterLocation,
            'phone' => $data['phone'],
            'dob' => $data['dob'],
            'gender' => $data['gender'],
            'password' => bcrypt($data['password']),
            'is_admin' => 0,
        ]);
    }
}


