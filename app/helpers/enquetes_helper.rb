module EnquetesHelper
  def area_list
    return [
      "-- 山梨県全域 --",
      "甲府市",
      "富士吉田市",
      "都留市",
      "山梨市",
      "韮崎市",
      "昭和町",
      "南アルプス市",
      "北杜市",
      "甲斐市",
      "笛吹市",
      "上野原市",
      "甲州市",
      "中央市",
      "市川三郷町",
      "早川町",
      "身延町",
      "南部町",
      "富士川町",
      "道志村",
      "西桂町",
      "忍野村",
      "山中湖村",
      "鳴川村",
      "富士河口湖町",
      "小菅村",
      "丹波山村"
    ]
  end

  #アンケート新規登録フォーム最初のページパンクズリスト
  def qnquete_new_form_bread
    return "
    <div class='bread-content'>
      <a href= '/' >HOME</a>
      <a href= '/enquetes/#{current_user.id}/user/index'>アンケート一覧</a>
      新規アンケート作成
    </div> ".html_safe
  end

  
end
