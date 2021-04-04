@if (Session::get('success'))
    <div class="alert alert-success" role="alert">
        {{ Session::get('success') }}
    </div>
@endif
@if (Session::get('error'))
    <div class="alert alert-danger" role="alert">
        {{ Session::get('error') }}
    </div>
@endif
@if (Session::get('warning'))
    <div class="alert alert-warning" role="alert">
        {{ Session::get('warning') }}
    </div>
@endif

