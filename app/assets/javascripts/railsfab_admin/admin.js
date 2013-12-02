// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    $("select.edit-select").each(function(){
        val = $(this).data("val");
        if(val !== undefined){
            $(this).val(val);
        }   

    });
});


$(".submit_btn").click(function(e){
    if(!$(".cb-enable-field:checked").length){
        e.preventDefault();
        alert("Please enable some of the fields(by checking) so only selected fields will be updated");
    }
});

$(".date").datepicker();


