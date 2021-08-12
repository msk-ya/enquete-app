document.addEventListener("turbolinks:load",function(){
  var editCheck = document.getElementById("edit_type");                     //チェックボックステキスト側
  var selectCheck = document.getElementById("select_type");                 //チェックボックスセレクト側
  var textArea = document.getElementById("edit-question-area");             //書き込み型のフォーム
  var selectArea = document.getElementById("select-question-area")          //選択式型のフォーム
  var selectAddButton = document.getElementById("add-select");              //選択追加ボタン
  var selectDeleteButton = document.getElementById("delete-select");        //選択追加ボタン
  var selectForm = document.getElementById("select-area");                  //選択フォーム内
  var pushCount = 0;
  
  var selectChildCount = selectForm.childElementCount;                      //選択式型のフォームの子要素の総数
  var selectIdNumber = selectChildCount / 2 - 1;                            //子要素総数のラベル分を排除し0カウントから始まるので-1する。

  var backAdminList = document.getElementById('back-admin-list');           //新規作成時戻るボタン


  //プラスボタンの処理
  selectAddButton.addEventListener('click',function(){                      
    pushCount ++;
    selectChildCount += 2;
    selectDeleteButton.style.display = "inline";                            //マイナスボタン表示

    var addLabel = document.createElement("label");
    addLabel.textContent = `選択項目${ pushCount + selectIdNumber +1}`;
    addLabel.id =`label${pushCount}`;
    selectForm.appendChild(addLabel);

    var addField = document.createElement("input");
    addField.setAttribute("type", "text");
    addField.className = "form-control";
    addField.id = `text${pushCount}`;
    addField.name ="form[check[][content]]";
    selectForm.appendChild(addField);
    
  })
  //マイナスボタンの処理
  selectDeleteButton.addEventListener("click",function(){
    if (selectChildCount > 4){
      var deletelabel = document.getElementById("label" + pushCount);
      deletelabel.remove();

      var deleteText = document.getElementById("text" + pushCount);
      deleteText.remove();
      pushCount --;
      selectChildCount -= 2;
      if (selectChildCount === 4) {
        selectDeleteButton.style.display = "none";
      }
    }
    
    
  });

  //チェックボックス操作
  editCheck.addEventListener('change',function(){
    textArea.style.display = "block";
    selectArea.style.display = "none";
  })
  selectCheck.addEventListener('change',function(){
    textArea.style.display = "none";
    selectArea.style.display = "block";
  });
});

 //新規作成時一覧リストに戻る
function backAdminLists(id, question){
  var result = confirm('アンケート一覧に戻ります。未作成の場合アンケートが破棄されます。よろしいですか？');
  if (result) {
    $.ajax({
      url: "https://yamanasi-enquete.herokuapp.com/questions/cancel",
      type: 'POST',
      dataType: 'json',
      data: {user_id: id, question_id: question },
      timeout: 3000,
    }).done(function (data) {
      alert('キャンセルしました。');
      document.location = `https://yamanasi-enquete.herokuapp.com/enquetes/${id}/user/index`;
    }).fail(function (XMLHttpRequest, textStatus, errorThrown) {
      document.location = `https://yamanasi-enquete.herokuapp.com/enquetes/${id}/user/index`;
    });

   
  }
}

