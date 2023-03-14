<?php

namespace App\Exports;

use App\Models\Enrollment;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;

class EnrollmentExport implements FromCollection, WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        //return Enrollment::all();

       return DB::table('enrollments')
            ->join('users', 'users.id', '=', 'enrollments.user_id')
            ->join('courses', 'courses.id', '=', 'enrollments.course_id')
            ->select('users.name','users.email', 'courses.title', 'enrollments.pass_score', 'enrollments.progress', 'enrollments.score', 'enrollments.completed', 'enrollments.graduate')
            ->get();
    }

    public function headings(): array
    {
        return [
            'Name',
            'E-mail',
            'Course',
            'Pass score',
            'Progress',
            'Score',
            'Completed',
            'Graduate'
        ];
    }
}
