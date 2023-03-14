<section>
    <h2 class="text-lg font-medium text-gray-900">
        {{ $user->name }}
    </h2>
    <p class="mt-1 text-sm text-gray-600">
        {{ $user->email }}
    </p>   
    <div class="flex flex-wrap">
        <div class="w-full md:w-1/2 xl:w-1/3 p-6">
            <div class="border rounded-lg shadow-xl p-5">
                <div class="flex flex-row items-center">                                
                    <div class="flex-1 text-center">
                        <h5 class="font-bold text-gray-600">Nota media</h5>
                        <h3 class="font-bold text-3xl">{{ $nota_media }}</h3>
                    </div>
                </div>
            </div>
            <p class="mt-3 text-sm text-gray-600 text-center">
                Esta nota media se calcula en función de los cursos a los que está inscrito.
            </p> 
            <p class="mt-3 text-sm text-gray-600 text-center">
                Todos los cursos tienen el mismo peso en la nota media.
            </p> 
        </div>
        <div class="w-full md:w-1/2 xl:w-1/3 p-6">
            <div class="border rounded-lg shadow-xl p-5">
                <div class="flex flex-row items-center">                                
                    <div class="flex-1 text-center">
                        <h5 class="font-bold text-gray-600">Progreso medio</h5>
                        <h3 class="font-bold text-3xl">{{ $progreso_medio }}</h3>
                    </div>
                </div>
            </div>
            <p class="mt-3 text-sm text-gray-600 text-center">
                Este progreso medio se calcula en función de los cursos a los que está inscrito.
            </p>
            <p class="mt-3 text-sm text-gray-600 text-center">
                Todos los cursos tienen el mismo peso en la nota media.
            </p> 
        </div>             
    </div>     
</section>