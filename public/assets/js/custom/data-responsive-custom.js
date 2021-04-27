$(document).ready(function() {
    let _token  =   $("input[name='_token']").val();
    let dataString  = '_token='+_token;
    setTimeout(function() {
        // [ Configuration Option ]
        $('#res-config').DataTable({
            responsive: true,
            "drawCallback": function( settings ) {
                alert( 'DataTables has redrawn the table' );

                $('.status').click(function (e) {
                    e.preventDefault();
                    let element = $(this);
                    let status  = $(this).attr('data-value');
                    let seller  = $(this).attr('data-id');
                    let msg     = '';

                    dataString += '&status='+ status + '&seller='+seller;

                    if (status == 1) {
                        msg = 'Are you sure, do you want to disable seller?';
                    }
                    else{
                        msg = 'Are you sure, do you want to activate seller?';
                    }

                    bootbox.confirm({
                        message: msg,
                        buttons: {
                            confirm: {
                                label: 'Yes',
                                className: 'btn-success'
                            },
                            cancel: {
                                label: 'No',
                                className: 'btn-danger'
                            }
                        },
                        callback: function (result) {
                            $.ajax({
                                url:'handleSellerStatus',
                                type:'post',
                                dataType: 'JSON',
                                data:dataString,
                                success:function(response){
                                    console.log(response);
                                    var msg = "";
                                    if (response['code'] == 200) {
                                        if (response['status'] == 1) {
                                            element.text('Active');
                                            element.removeClass('btn-danger');
                                            element.addClass('btn-success');
                                        }
                                        else {
                                            element.text('Inactive');
                                            element.removeClass('btn-success');
                                            element.addClass('btn-danger');

                                        }

                                        element.attr('data-value', response['status']);

                                    }


                                    /*if(response == 1){
                                        window.location = "home.php";
                                    }else{
                                        msg = "Invalid username and password!";
                                    }
                                    $("#message").html(msg);*/
                                }
                            });
                        }
                    });
                })
            }
        });

        // [ New Constructor ]
        var newcs = $('#new-cons').DataTable();

        new $.fn.dataTable.Responsive(newcs);

        // [ Immediately Show Hidden Details ]
        $('#show-hide-res').DataTable({
            responsive: {
                details: {
                    display: $.fn.dataTable.Responsive.display.childRowImmediate,
                    type: ''
                }
            }
        });

    }, 350);
});
