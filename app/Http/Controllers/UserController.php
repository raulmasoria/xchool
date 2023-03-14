<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Course;
use App\Models\Enrollment;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Pagination\Paginator;
use Illuminate\Pagination\LengthAwarePaginator;

class UserController extends Controller
{
    public function index()
    {
        //recupero los curso, usuarios y enrollments
        $courses = Course::all();
        $users = User::all();
        $enrollments = Enrollment::all();

        //recorro enrollments para sacar el curso y usuario de cada uno y formo un array.
        $arrayEnrollments = array();
        foreach ($enrollments as $enrollment)
        {
            foreach($users as $user)
            {
                foreach($courses as $course)
                {
                    if($enrollment->user_id == $user->id && $enrollment->course_id == $course->id){
                        $arrayEnrollments[$enrollment->id] =  array('user' => $user->name, 'email' => $user->email, 'course' => $course->title, 'pass_score' => $enrollment->pass_score, 'progress' => $enrollment->progress, 'score' => $enrollment->score, 'completed' => $enrollment->completed, 'graduate' => $enrollment->graduate );
                    }
                    
                }
            }
            
        }

        //pagino el array
        $enrollmentsPaginate = $this->paginate($arrayEnrollments);

        return view('index',[
            "enrollments" => $enrollmentsPaginate
        ]);
    }  

    //generar paginación de un array
    public function paginate($items, $perPage = 20, $page = null, $options = [])
    {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }
   
    
    
}
