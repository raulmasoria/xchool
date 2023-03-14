<section>
    <header>
        <h2 class="text-lg font-medium text-gray-900">
            {{ __('Datos del curso') }}
        </h2>

        <p class="mt-1 text-sm text-gray-600">
            {{ __("Aquí puedes consultar y actualizar algunos datos del curso.") }}
        </p>
        
    </header>

    <form method="post" action="{{ route('enrollment.update' , $enrollment) }}" class="mt-6 space-y-6">
        @csrf
        @method('patch')

        <p class="mt-1 block font-medium text-sm text-gray-700">
            {{ "Curso: " . $course->title }}
        </p>
        
        <div>
            <x-input-label for="pass_score" :value="__('Nota de corte')" />
            <x-text-input id="pass_score" name="pass_score" type="number" class="mt-1 block w-full" :value="old('pass_score', $enrollment->pass_score)" required autofocus autocomplete="pass_score"/>
            <x-input-error class="mt-2" :messages="$errors->get('pass_score')" />
        </div>

        <div>
            <x-input-label for="progress" :value="__('Progreso')" />
            <x-text-input id="progress" name="progress" type="number" class="mt-1 block w-full" :value="old('progress', $enrollment->progress)" required autofocus autocomplete="progress" />
            <x-input-error class="mt-2" :messages="$errors->get('progress')" />
        </div>

        <div>
            <x-input-label for="score" :value="__('Nota')" />
            <x-text-input id="score" name="score" type="number" class="mt-1 block w-full" :value="old('score', $enrollment->score)" required autofocus autocomplete="score"/>
            <x-input-error class="mt-2" :messages="$errors->get('score')" />
        </div>

        <p class="mt-1 block font-medium text-sm text-gray-700">
            @if($enrollment->completed == 1)
                {{ "Curso completado: Si" }}
            @else 
                {{ "Curso completado: No" }}            
            @endif
       
        </p>

        <p class="mt-1 block font-medium text-sm text-gray-700">
            @if($enrollment->graduate == 1)
                {{ "Alumno graduado: Si" }}
            @else 
                {{ "Alumno graduado: No" }}             
            @endif 
            
        </p>

        <div class="flex items-center gap-4">
            <x-primary-button>{{ __('Guardar') }}</x-primary-button>

            @if (session('status') === 'enrollment-updated')
                <p
                    x-data="{ show: true }"
                    x-show="show"
                    x-transition
                    x-init="setTimeout(() => show = false, 2000)"
                    class="text-sm text-gray-600"
                >{{ __('Guardado.') }}</p>
            @endif
        </div>
    </form>
</section>
