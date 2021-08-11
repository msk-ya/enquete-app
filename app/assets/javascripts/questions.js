document.addEventListener("turbolinks:load", function () {
  document.querySelectorAll(".questin-delete").forEach(function(btn){
    btn.addEventListener('click',function(){
      btn.addEventListener('ajax:success',function(){
        var id = btn.id.split('question-delete-')[1];
        document.getElementById("question-modal-confirm-" + id ).style.display = "none";
        document.getElementById("enquete-question-li-" + id ).style.display = "none";
        btn.style.display = "none";

      })
    })
  });
});
