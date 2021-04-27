<li>
    <div class="dropdown drp-user">
        <a href="#!" class="dropdown-toggle" data-toggle="dropdown">
            <img src="assets/images/user/avatar-1.jpg" class="img-radius wid-40" alt="User-Profile-Image">
        </a>
        <div class="dropdown-menu dropdown-menu-right profile-notification">
            <div class="pro-head">
                <img src="assets/images/user/avatar-1.jpg" class="img-radius" alt="User-Profile-Image">
                <span>@if(isset(Auth::user()->name)) {{Auth::user()->name}} @endif</span>
                <a href="{{route('logout')}}" class="dud-logout" title="Logout" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                    <i class="feather icon-log-out"></i>
                </a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                    @csrf
                </form>
            </div>
            {{--<ul class="pro-body">
                <li><a href="user-profile.html" class="dropdown-item"><i class="feather icon-user"></i> Profile</a></li>
                <li><a href="email_inbox.html" class="dropdown-item"><i class="feather icon-mail"></i> My Messages</a></li>
                <li><a href="auth-signin.html" class="dropdown-item"><i class="feather icon-lock"></i> Lock Screen</a></li>
            </ul>--}}
        </div>
    </div>
</li>
