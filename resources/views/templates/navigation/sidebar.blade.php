<nav class="pcoded-navbar menupos-fixed menu-light ">
    <div class="navbar-wrapper  ">
        <div class="navbar-content scroll-div " >
            <ul class="nav pcoded-inner-navbar ">
                <li class="nav-item pcoded-menu-caption">
                    <label>Navigation</label>
                </li>
                <li class="nav-item">
                    <a href="{{route('home')}}" class="nav-link ">
                        <span class="pcoded-micon"><i class="feather icon-home"></i></span>
                        <span class="pcoded-mtext">Home</span></a>
                </li>
                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link ">
                        <span class="pcoded-micon"><i class="feather icon-home"></i></span>
                        <span class="pcoded-mtext">Subscribers</span>
                    </a>
                    <ul class="pcoded-submenu">
                        <li><a href="{{route('subscribers/manage')}}">Manage</a></li>
                        {{--<li><a href="{{route('business/add')}}">Add</a></li>--}}
                    </ul>
                </li>

                {{--<li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link ">
                        <span class="pcoded-micon">
                            <i class="feather icon-users"></i>
                        </span>
                        <span class="pcoded-mtext">Employees</span></a>
                    <ul class="pcoded-submenu">
                        <li><a href="user-list.html">Manage</a></li>
                        <li><a href="user-profile.html">Add</a></li>
                    </ul>
                </li>--}}

            </ul>

<!--            <div class="card text-center">
                <div class="card-block">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <i class="feather icon-sunset f-40"></i>
                    <h6 class="mt-3">Help?</h6>
                    <p>Please contact us on our email for need any support</p>
                    <a href="#!" target="_blank" class="btn btn-primary btn-sm text-white m-0">Support</a>
                </div>
            </div>-->

        </div>
    </div>
</nav>
