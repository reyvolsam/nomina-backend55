<?php

use App\Http\Controllers\Catalogs\JobsController;
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

Route::group(['prefix' => 'auth'], function () {
    Route::post('login', 'Auth\LoginController@auth');
    Route::post('logout', 'Auth\LoginController@logout');
});


Route::group(['middleware' => ['cors', 'auth:api']], function (){
    Route::resource('group', 'GroupController');

    Route::post('user/searchCompany', 'UserController@searchCompanies');
    Route::resource('user', 'UserController');
    
    Route::resource('imss', 'ImssController');
    Route::resource('receipts', 'ReceiptsController');

    Route::resource('company', 'Catalogs\CompanyController');
    Route::resource('contractTypes', 'Catalogs\ContractTypesController');
    Route::resource('contributionBases', 'Catalogs\ContributionBasesController');
    Route::resource('employeeTypes', 'Catalogs\EmployeeTypesController');
    Route::resource('workShifts', 'Catalogs\WorkShiftsController');
    Route::resource('paymentMethods', 'Catalogs\PaymentMethodsController');
    Route::resource('sexs', 'Catalogs\SexsController');
    Route::resource('discountTypes', 'Catalogs\DiscountTypesController');
    Route::resource('periodTypes', 'Catalogs\PeriodTypesController');
    Route::resource('departments', 'Catalogs\DepartmentController');
    Route::resource('jobs', 'Catalogs\JobsController');
    
    Route::resource('work', 'WorkController');
    Route::post('work/convert', 'WorkController@convert');
    Route::post('work/loadData', 'WorkController@loadWorkData');
    Route::post('work/import', 'WorkImportController@import');
    Route::post('work/uploadDoc', 'WorkController@uploadDoc');


    Route::post('workByStatus', 'WorkController@workByStatus');
    Route::post('getDepartmentFromCompany', 'Catalogs\JobsController@getDepartmentFromCompany');
    Route::post('getMenus', 'SharedController@BuildSystemMenu');
    Route::post('getJobsFromDepartment', 'SharedController@getJobsFromDepartment');
    Route::post('getCatalogsFromCompany', 'SharedController@getCatalogsFromCompany');
    Route::get('catalogCompanies', 'SharedController@getCompanyCatalogFromUser');
    Route::get('catalogCompaniesDepartments', 'SharedController@getCompanyCatalogFromUserDepartments');

    Route::resource('nomina', 'NominaController');
    Route::resource('cfdiNomina', 'CfdiNominaController');
    Route::resource('backupSua', 'BackupSUAController');
    Route::post('backupSua/search', 'BackupSUAController@searchBackupSua');

});
