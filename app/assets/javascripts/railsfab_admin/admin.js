// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(".submit_btn").click(function(e){
    if(!$(".cb-enabled-field").length){
        e.preventDefault();
        alert("Please enable some of the fields(by checking) so only selected fields will be updated");
    }
});
