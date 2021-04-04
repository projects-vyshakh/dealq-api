{{$pageTitle}}
@if(isset($pageTitle) || isset($breadcrumbs))
<div class="page-header">
    <div class="page-block">
        <div class="row align-items-center">
            <div class="col-md-12">
                @if(!empty($pageTitle))
                    <div class="page-header-title">
                        <h5 class="m-b-10">
                           {{$pageTitle}}
                        </h5>
                    </div>
                @endif

                @if(!empty($breadcrumbs))
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{route('home')}}">
                                <i class="feather icon-home"></i>
                            </a>
                        </li>
{{--                        <li class="breadcrumb-item"><a href="#!">Page Layout</a></li>--}}
                        <li class="breadcrumb-item"><a>{{$breadcrumbs}}</a></li>
                    </ul>
                @endif

            </div>
        </div>
    </div>
</div>
@endif
