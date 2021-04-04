<!DOCTYPE html>
<html lang="en">

<head>
    @include('templates.header.includes.title')
    @include('templates.header.includes.meta')
    @include('templates.header.includes.favicon')
    @include('templates.assets.styles')
</head>

<body>
<!-- [ Pre-loader ] start -->
@include('templates.content.preloader')
<!-- [ Pre-loader ] End -->

<!-- [ navigation menu ] start -->
@include('templates.navigation.topbar')
<!-- [ navigation menu ] end -->
<!-- [ Header ] start -->
<header class="navbar pcoded-header navbar-expand-lg navbar-light header-blue">
    <div class="container">
        @include('templates.header.includes.logo')
        <div class="collapse navbar-collapse">
            {{--@include('templates.header.includes.search')--}}
            <ul class="navbar-nav ml-auto">
                @include('templates.header.includes.notifications')
                {{--@include('templates.header.includes.messages')--}}
                @include('templates.header.includes.user-profile')
            </ul>
        </div>
    </div>
</header>
<!-- [ Header ] end -->

<!-- [ Main Content ] start -->
<div class="pcoded-main-container">
    <div class="pcoded-wrapper container">
        <div class="pcoded-content">
            <div class="pcoded-inner-content">
                <div class="main-body">
                    <div class="page-wrapper">
                        @include('templates.content.breadcrumbs')
                        @yield('contents')
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [ Main Content ] end -->

<!-- Required Js -->
@include('templates.assets.scripts')

</body>
</html>
