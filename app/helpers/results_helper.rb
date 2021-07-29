module ResultsHelper
  #各選択肢の合計

  def selects_totals
    hash = {}                                               #=>最終的な集計データハッシュ型
    @select_titles.each_with_index do |title, i|            #=>タイトル毎に分割
      result_count = 0                                      #=>各アンケート合計数
      @selects[i][title].values.each do |num|
         result_count += num.to_i
      end
      hash[title] = result_count
    end
    return hash
  end

  #パーセント計算
  def enquete_rate(num, max)
    return (num.to_f / max.to_f * 100).to_i
  end

  #アンケートパンクズリスト
  def results_answer_bread
      return "
        <div class='bread-content'>
          <a href= '/' >HOME</a>
          <a href= '/pages/index'>アンケート一覧</a>
          アンケート:#{ @enquete.title }
        </div> ".html_safe
  end

  #アンケートパンクズリスト
  def results_aggregate_bread
      return "
        <div class='bread-content'>
          <a href= '/' >HOME</a>
          <a href= '/pages/index'>アンケート一覧</a>
          集計タイトル:#{ @enquete.title }
        </div> ".html_safe
  end
  
end
