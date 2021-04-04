    @section('custom-styles')
    <!-- data tables css -->
    <link rel="stylesheet" href="{{URL::asset('assets/css/plugins/dataTables.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{URL::asset('assets/css/plugins/responsive.bootstrap4.min.css')}}">
@endsection

@section('content')
    <div class="row">
        <!-- Config table start -->
        <div class="col-sm-12">
            <div class="card">
                @yield('card-header')

                @if ($tableData['tableHeadsCount'] > 0)
                    <div class="card-body">
                    <table id="res-config" class="display table table-striped table-hover dt-responsive nowrap" style="width:100%">
                        <thead>
                        <tr>
                            @for($head = 0; $head < count($tableData['data'][0]); $head++)
                                @if (array_values($tableData['data'][0])[$head]['visible'])
                                    <th>
                                        @php print_r(array_keys($tableData['data'][0])[$head]); @endphp
                                    </th>
                                @endif
                            @endfor
                        </tr>
                        </thead>
                        <tbody>
                            @foreach($tableData['data'] as $key=> $data)
                                <tr>
                                    @for($head = 0; $head < count($tableData['data'][$key]); $head++)
                                        @if (array_values($tableData['data'][0])[$head]['visible'])
                                            <td>@php print_r(array_values($tableData['data'][$key])[$head]['value']); @endphp</td>
                                        @endif
                                    @endfor
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                @endif

            </div>
        </div>
    </div>
@endsection

@section('custom-scripts')
    <script type="text/javascript" src="{{URL::asset('assets/js/plugins/jquery.dataTables.min.js')}}"></script>
    <script type="text/javascript" src="{{URL::asset('assets/js/plugins/dataTables.bootstrap4.min.js')}}"></script>
    <script type="text/javascript" src="{{URL::asset('assets/js/plugins/dataTables.responsive.min.js')}}"></script>
    <script type="text/javascript" src="{{URL::asset('assets/js/pages/data-responsive-custom.js')}}"></script>
    <script type="text/javascript" src="{{URL::asset('assets/js/custom/newsletter.js')}}"></script>
@endsection









