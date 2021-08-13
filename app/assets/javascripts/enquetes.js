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
  $(function () {
    //定義
    $.datepicker.setDefaults({
      dateFormat: 'yy/mm/dd',
      showButtonPanel: true,
      buttonImage: 'icon.jpg',
      buttonImageOnly: true,
      buttonText: "",
      minDate: 0,
      showOn: "both",
      closeText: '閉じる',
      prevText: '前へ',
      nextText: '次へ',
      currentText: '今日',
      monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
      monthNamesShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
      dayNames: ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'],
      dayNamesShort: ['日曜', '月曜', '火曜', '水曜', '木曜', '金曜', '土曜'],
      dayNamesMin: ['日', '月', '火', '水', '木', '金', '土'],
      yearSuffix: '年',
      firstDay: 0
    });

    //表示設定
    $('#dp1').css("width","calc( 4/5*100%");
    $("#dp1").datepicker();
    $("#dp2").datepicker();
    $("#dp3").datepicker();

  });
});
//質問登録時のキャンセル処理
function cancelEnquete(id, enquete){
  var result = confirm('アンケート一覧に戻ります。未作成の場合アンケートが破棄されます。よろしいですか？');
  if (result) {
    $.ajax({
      url: "/enquetes/cancel",
      type: 'POST',
      dataType: 'json',
      data: { user_id: id, enquete_id: enquete },
      timeout: 3000,
    }).done(function (data) {
      alert('キャンセルしました。');
      document.location = `/enquetes/${id}/user/index`;
    }).fail(function (XMLHttpRequest, textStatus, errorThrown) {
      alert('キャンセルしました。');
      document.location = `/enquetes/${id}/user/index`;
    });


  }
}