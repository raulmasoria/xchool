<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'title',
    ];

    public function enrollment()
    {
        return $this->hasMany(Enrollment::class);
    }
}

