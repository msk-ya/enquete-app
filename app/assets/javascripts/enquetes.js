// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener("turbolinks:load",function(){
  document.querySelectorAll(".question-edit-btn").forEach(function(btn){
      btn.addEventListener('click',function(){
        var id = this.id.split("edit-btn-")[1];
        $("#enquete-question-" +id ).slideToggle();

      });
  });
  /*アンケートの削除*/
  document.querySelectorAll(".enquete-lists").forEach(function(btn){
    btn.addEventListener('ajax:success',function(){
      var enqueteId = btn.id.split("enquete-list-")[1];
      document.getElementById("enquete-tr-" + enqueteId ).style.display = "none";

    });
  });
});