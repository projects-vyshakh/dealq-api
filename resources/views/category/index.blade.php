@extends('templates.layouts.master')

@include('components.alerts.alert')
@section('card-header')
    <div class="card-header text-right">
        <a href="" class="btn btn-success col-sm-12 col-lg-2 col-md-4" >Send Newsletters </a>
    </div>
@endsection

@include('templates.components.datatables.datatables')
