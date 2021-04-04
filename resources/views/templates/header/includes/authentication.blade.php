<li>
    <div class="dropdown drp-user">
        @if (Route::has('login'))
            <div class="top-right links">
                @auth

                @else
                    <a href="{{ route('login') }}" class="btn btn-success">Login</a>

                    @if (Route::has('register'))
                        <a href="{{ route('register') }}" class="btn btn-dark">Register</a>
                    @endif
                @endauth
            </div>
        @endif
    </div>
</li>
