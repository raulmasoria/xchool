@extends('layouts.app')

@section('contenido')

    <div class="relative items-top justify-center min-h-screen bg-gray-100 dark:bg-gray-900 sm:items-center py-4 sm:pt-0">
        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">

                <div class="rounded-lg border border-gray-200 shadow-md m-5">
                    <div class="bg-gray-100 py-10">
                        <h2 class="pt-6 text-2xl md:text-4xl text-gray-600 text-center font-extrabold my-5">XCHOOL</h2>
                        <a href="{{ route('enrollment.export') }}" class="p-6 flex justify-end gap-4" title="Exportar">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3 16.5v2.25A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75V16.5M16.5 12L12 16.5m0 0L7.5 12m4.5 4.5V3" />
                            </svg>                              
                        </a>
                    </div> 
                </div>               
                
                @if (count($enrollments) > 0)
                    <div class="overflow-hidden rounded-lg border border-gray-200 shadow-md m-5">
                        <table class="w-full border-collapse bg-white text-left text-sm text-gray-500">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Nombre y email</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Curso</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Nota de corte</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Progreso</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Puntuacion</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Completado</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Graduado</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Editar</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100 border-t border-gray-100">                                
                                @foreach ($enrollments as $enrollmentId => $enrollment)
                                    <tr class="hover:bg-gray-50">
                                        <th class="flex gap-3 px-6 py-4 font-normal text-gray-900">
                                            <div class="text-sm">
                                                <div class="font-medium text-gray-700">{{ $enrollment['user'] }}</div>
                                                <div class="text-gray-400">{{ $enrollment['email'] }}</div>
                                            </div>
                                        </th>                          
                                        <td class="px-6 py-4">
                                            <div class="font-medium text-gray-700">{{ $enrollment['course'] }}</div>
                                        </td>
                                        <td class="px-6 py-4">
                                            <div class="font-medium text-gray-700">{{ $enrollment['pass_score'] }}</div>
                                        </td>
                                        <td class="px-6 py-4">
                                            <div class="font-medium text-gray-700">{{ $enrollment['progress'] }}</div>
                                        </td>
                                        <td class="px-6 py-4">
                                            <div class="font-medium text-gray-700">{{ $enrollment['score'] }}</div>
                                        </td>                                
                                        <td class="px-6 py-4">   
                                            @if($enrollment['completed'])                                                                    
                                                <span class="inline-flex items-center gap-1 rounded-full bg-green-50 px-2 py-1 text-xs font-semibold text-green-600">
                                                    <span class="h-1.5 w-1.5 rounded-full bg-green-600"></span>
                                                    Curso completo
                                                </span>    
                                            @else                        
                                                <span class="inline-flex items-center gap-1 rounded-full bg-red-50 px-2 py-1 text-xs font-semibold text-red-600">
                                                    <span class="h-1.5 w-1.5 rounded-full bg-red-600"></span>
                                                    Curso no completo
                                                </span>                                    
                                            @endif    
                                        </td>
                                        <td class="px-6 py-4">   
                                            @if($enrollment['graduate'])                                                                    
                                                <span class="inline-flex items-center gap-1 rounded-full bg-green-50 px-2 py-1 text-xs font-semibold text-green-600">
                                                    <span class="h-1.5 w-1.5 rounded-full bg-green-600"></span>
                                                    Alumno graduado
                                                </span>    
                                            @else                        
                                                <span class="inline-flex items-center gap-1 rounded-full bg-red-50 px-2 py-1 text-xs font-semibold text-red-600">
                                                    <span class="h-1.5 w-1.5 rounded-full bg-red-600"></span>
                                                    Alumno no graduado
                                                </span>                                    
                                            @endif    
                                        </td>
                                        <td class="px-6 py-4">
                                            <div class="flex justify-end gap-4">
                                                <a href="{{ route('enrollment.edit', $enrollmentId) }}" title="Editar">
                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-6 w-6" x-tooltip="tooltip">
                                                        <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125"></path>
                                                    </svg>
                                                </a>                                    
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach                       
                            </tbody>
                        </table>                        
                    </div>                
                @endif

                <div class="container">
                    {{ $enrollments->links() }}
                </div>
                
            </div>            
        </div>
    </div>

    
@endsection
