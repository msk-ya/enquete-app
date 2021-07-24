module PagesHelper

  #アンケート一覧ページパンクズリスト
  def qnquete_index_bread
    return "<div class='bread-content'><a href= '/' >HOME</a>アンケート一覧</div> ".html_safe
  end

  #新着アンケートパンクズリスト
  def enquete_recently_bread
    return "
      <div class='bread-content'>
        <a href= '/' >HOME</a>
        <a href= '/pages/index'>アンケート一覧</a>
        新着アンケート
      </div> ".html_safe
  end
  
  
end
