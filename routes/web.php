<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\EnrollmentsController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/


Route::middleware('auth')->group(function () {
    Route::get('/', [UserController::class, 'index'])->name('index');

    Route::get('/edit/{enrollment}', [EnrollmentsController::class, 'edit'])->name('enrollment.edit');
    Route::patch('/edit/{enrollment}/update', [EnrollmentsController::class, 'update'])->name('enrollment.update');
    Route::get('/enrollment/export', [EnrollmentsController::class, 'export'])->name('enrollment.export');
});

require __DIR__.'/auth.php';
