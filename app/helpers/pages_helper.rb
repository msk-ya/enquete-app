module PagesHelper

  #アンケート一覧ページパンクズリスト
  def qnquete_index_bread
    if params.nil?
      return "<div class='bread-content'><a href= '/' >HOME</a>アンケート一覧</div> ".html_safe
    elsif params[:search].present?
      return "
      <div class='bread-content'>
        <a href= '/' >HOME</a>
        <a href= '/pages/index'>アンケート一覧</a>
        タイトル検索:#{ params[:search] }
      </div> ".html_safe

    elsif params[:date].present?
      return "
      <div class='bread-content'>
        <a href= '/' >HOME</a>
        <a href= '/pages/index'>アンケート一覧</a>
        日付検索:#{ params[:date] }
      </div> ".html_safe
    end
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

  #地域別アンケートパンクズリスト
  def enquete_area_bread
    if params[:area].nil?
      return "
        <div class='bread-content'>
          <a href= '/' >HOME</a>
          <a href= '/pages/index'>アンケート一覧</a>
          地域検索：山梨全域
        </div> ".html_safe
    else
       return "
        <div class='bread-content'>
          <a href= '/' >HOME</a>
          <a href= '/pages/index'>アンケート一覧</a>
            <a href= '/pages/area'>地域全域</a>
          地域検索：#{ params[:area] }
        </div> ".html_safe   
    end
  end
  
  
end
