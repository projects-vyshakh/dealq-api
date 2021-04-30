<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

Route::any('seller-login', 'SellersController@sellerLogin');

Route::any('login', 'UserController@login');

Route::any('logout', 'UserController@logout');

Route::any('listAllUsers', 'UserController@listAllUsers');

Route::any('listUser', 'UserController@listUser');

Route::any('createUser', 'UserController@createUser');

Route::any('multiLevelCategory', 'CategoryController@multiLevelCategory');

Route::any('createUserWithMobile', 'UserController@createUserWithMobile');

Route::any('userOtpAuthentication', 'UserController@userOtpAuthentication');

Route::any('updateUser', 'UserController@updateUser');

Route::any('deleteUser', 'UserController@deleteUser');

Route::any('listCategory', 'CategoryController@listCategory');

Route::any('createCategory', 'CategoryController@createCategory');

Route::any('deleteCategory', 'CategoryController@deleteCategory');

Route::any('createProduct', 'ProductController@createProduct');

Route::any('updateProduct', 'ProductController@updateProduct');

Route::any('listAllProducts', 'ProductController@listAllProducts');

Route::any('listProduct', 'ProductController@listProduct');

Route::any('updatePublishStatus', 'ProductController@updatePublishStatus');

Route::any('deleteProduct', 'ProductController@deleteProduct');

Route::any('createSeller', 'SellersController@createSeller');

Route::any('generateQrCode', 'QrController@generateQrCode');

Route::any('listSubscriptionPlans', 'SubscriptionsController@listSubscriptionPlans');

Route::any('addSubscription', 'SubscriptionsController@addSubscription');








