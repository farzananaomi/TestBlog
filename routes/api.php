<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware' => ['api']], function () {


    Route::POST('/register', 'ApiTokenController@register');

    Route::POST('/login', 'ApiTokenController@login');
    Route::get('/stories', 'ApiTokenController@stories');
    Route::get('/stories/{id}', 'ApiTokenController@stories_id');
    Route::get('/stories/{id}/comments', 'ApiTokenController@comments');
    Route::POST('/profile', 'ApiTokenController@profile');

    Route::POST('/stories', 'ApiTokenController@stories_share');
    Route::POST('/stories/{id}/stories', 'ApiTokenController@comments_share');





});