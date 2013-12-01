// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$("input[type=submit]").click(function(){
    if($(".cb-enabled-field").length){
        e.preventDefault();
        alert("None of the fields are enabled to be updated. Please check the boxes to enable those checked fields to be updated")
    }
});
    
