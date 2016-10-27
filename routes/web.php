<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', 'HomeController@index');

Auth::routes();

Route::get('/home', 'HomeController@index');

Route::POST('comment/{story_id?}', 'CommentController@create');


Route::POST('story2', 'StoryController@create');
Route::get('profile','StoryController@index' );
Route::get('sedit/{story_id}', 'StoryController@edit');

Route::get('sdelete/{story_id?}', 'StoryController@destroy');

Route::get('sblock/{story_id?}', 'StoryController@block');
Route::POST('supdate/{story_id?}', 'StoryController@update');

Route::get('user_edit/', 'UserController@edit');

Route::POST('user_update/', 'UserController@update');
Route::get('user_edit/', 'UserController@edit');

Route::get('admin/', 'AdminController@index');
Route::get('admin/admin_users/', 'AdminController@show_admin');
Route::get('admin/users/', 'AdminController@show_users');
Route::get('admin/add/', 'AdminController@add');
Route::POST('admin/store/', 'AdminController@store');
Route::POST('admin/update/{id?}', 'AdminController@update');
Route::get('admin/edit/{id?}', 'AdminController@edit');
Route::get('admin/udelete/{id?}', 'AdminController@destroy');
Route::get('admin/cdelete/{id?}', 'CommentController@delete');
Route::get('admin/block/{id?}', 'AdminController@block');
/*
Route::POST('comment/{story_id}', function ($story_id) {
    print_r($story_id);
    print_r($_POST);
    //return 'Hello World';
});*/