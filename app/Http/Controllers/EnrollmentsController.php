<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Course;
use App\Models\Enrollment;
use Illuminate\Http\Request;
use App\Exports\EnrollmentExport;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Redirect;
use App\Http\Controllers\CoursesController;

class EnrollmentsController extends Controller
{
    public function edit(Enrollment $enrollment)
    {       
        //obtengo valores del curso y del usuario
        $course = Course::where('id',$enrollment->course_id)->firstOrFail(); 
        $user = User::where('id',$enrollment->user_id)->firstOrFail(); 

        //Recupero los diferentes cursos para obtener la nota media y el progreso medio
        $enrollments =  Enrollment::where('user_id',$enrollment->user_id)->get();
        $nota = 0;
        $progreso = 0;        
        foreach($enrollments as $enrollment_row){
            $nota = $nota + $enrollment_row->score;
            $progreso = $progreso + $enrollment_row->progress;
        }
        $nota_media = $nota / count($enrollments);
        $progreso_medio = $progreso / count($enrollments);

        //Lo paso a la vista
        return view('enrollment.edit',[
            'enrollment' => $enrollment,
            'course' => $course,
            'user' => $user,
            'nota_media' => $nota_media,
            'progreso_medio' => $progreso_medio
        ]);
    }

    public function update(Request $request, Enrollment $enrollment)
    {   
        //Valido resultados
        $request->validate([
            'pass_score' => ['string', 'max:255'],
            'progress' => ['string', 'max:255'],            
            'score' => ['Numeric']            
        ]);

        //Asigno las nuevas respuestas
        $enrollment->pass_score = $request->pass_score;
        $enrollment->progress = $request->progress;
        $enrollment->score = $request->score;   
        //guardo
        $enrollment->save();

        //tras guardar los datos modificados compruebo si tiene el curso completo y si se gradua
        $this->courseCompleted($enrollment);
        $this->userGraduated($enrollment);

        //Redirecciono indicando que ha salido correcto.
        return Redirect::route('enrollment.edit',$enrollment)->with('status', 'enrollment-updated');
    }

    //Compruebo si se ha completado el curso
    public function courseCompleted(Enrollment $enrollment){  
        //si el progreso es 100, el curso está completo.      
        if($enrollment->progress == 100){
            $enrollment->completed = 1;        
            $enrollment->save();
        } else {
            $enrollment->completed = 0;          
            $enrollment->save();
        }
    }
    //Compruebo si se ha graduado el alumno, para ello tiene que tener todos los cursos completos al 100% y aprobados, es decir superada la nota de corte.
    public function userGraduated(Enrollment $enrollment){
        //Obtengo los cursos de ese alumno 
        $enrollments = Enrollment::where('user_id',$enrollment->user_id)->get();
        //Inicializo $graduate en true, si al final del foreach llega en true, el alumno tendrá todos los cursos aprobados y completados
        $graduate = true;
        foreach($enrollments as $enrollmentId => $enrollment){
            if($enrollment->progress == 100){
                if($enrollment->score < $enrollment->pass_score){
                    $graduate = false;
                }        
            } else {
                $graduate = false;
            }
        }

        //Si es true el alumno estará graduado, se lo asigo a todos los cursos. En caso contrario guardo que no está graduado
        if($graduate){
            foreach($enrollments as $enrollmentId => $enrollment){
                $enrollment->graduate = 1;          
                $enrollment->save();    
            }
        } else {
            foreach($enrollments as $enrollmentId => $enrollment){
                $enrollment->graduate = 0;          
                $enrollment->save();    
            }
        }

        
    }

    public function export(){
        return Excel::download(new EnrollmentExport, 'enrollment.xlsx');
    }

    
}
