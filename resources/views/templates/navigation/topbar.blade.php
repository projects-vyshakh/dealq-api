<nav class="pcoded-navbar theme-horizontal menu-light brand-blue">
    <div class="navbar-wrapper container">
        <div class="navbar-content sidenav-horizontal" id="layout-sidenav">
            <ul class="nav pcoded-inner-navbar sidenav-inner">
                <li class="nav-item pcoded-menu-caption">
                    <label>Navigation</label>
                </li>
                <li class="nav-item">
                    <a href="{{route('home')}}" class="nav-link ">
                        <span class="pcoded-micon"><i class="feather icon-home"></i></span>
                        <span class="pcoded-mtext">Dashboard</span></a>
                </li>

                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link ">
                        <span class="pcoded-micon"><i class="feather icon-layout"></i></span>
                        <span class="pcoded-mtext">Catalog</span>
                    </a>
                    <ul class="pcoded-submenu">
                        <li><a href="{{route('category')}}">Category</a></li>
                        <li><a href="{{route('products')}}">Products</a></li>
                      </ul>
                </li>
                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link ">
                        <span class="pcoded-micon"><i class="feather icon-layers"></i></span>
                        <span class="pcoded-mtext">Seller Management</span>
                        <span class="pcoded-badge badge badge-success">100+</span>
                    </a>
                    <ul class="pcoded-submenu">
                        <li><a href="{{route('sellers')}}">Sellers</a></li>

                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
