class Enquete < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :results,   dependent: :destroy
  validates :title, presence: true, length: {maximum: 20}
  validates :content, presence: true
 
  scope :desc_sort, -> { order(created_at: :desc)}
  # Ex:- scope :active, -> {where(:active => true)}

  #アンケートの質問の数あるか判別

  def question_count?
    return questions.count >0? true : false
  end

#一覧表示、質問別に集計
#**********************************************************************************************************************************
def enquete_aggregate
  select_results = []                                               #=>選択タイプの集計
  text_results = []                                                 #=>入力タイプのテキストまとめ
  text_names = []                                                    #=>入力タイプの投稿者集計

  #選択タイプの集計の雛形配列の準備(formモデルにて記述)
    selects_array =  Form.SelectItems
   
  self.results.each do |result|
    #テキストタイプの結果格納
    text_hash = {}                                                  #=>レコード毎の入力データ格納ハッシュ
    name_hash = {}                                                  #=>タイトルと名前の格納
    result.text_title.each_with_index do |title, i|
      text_hash[title] = result.content[i]
      name_hash[title] = result.user_name
    end
    text_results.push(text_hash)                                    #=>全体のテキストタイプの集計に格納
    text_names.push(name_hash)                                      #=>全体の名前に格納

   

    #選択タイプの結果格納
    result.select_title.each_with_index do |title, i| 
      select_hash = {}                                                #=>レコード毎の選択データ格納ハッシュ
      select_record = result.select[i]
      select_data_array = select_record.split(',')
      #分割した各選択ごとに集計
      select_data_array.each do |data|
        item = data.split(":")[0]                                   #=>選択名
        number = data.split(":")[1].to_i                            #=>カウント数
        array_num = selects_array[i][item].to_i                     #=>全体集計の関連アイテムの数を呼び込み
        array_num += number                                         #=>上に結果を加算
        selects_array[i][item] = array_num                          #=>全体集計の反映
      end
      select_hash[title] =  selects_array[i]                        #=>タイトルと紐付いたハッシュのさくせい
      select_results.push(select_hash)                              #=>データ配列に上を格納
    end
  end
  return text_results, select_results.uniq, text_names
end
#*********************************************************************************************************

##質問タイトルを取得(配列)
  def enquete_titles(params)
    array = []
    params.each do |param|
       param.keys.each do |key|
         array.push(key)
       end
    end
    return array.uniq
  end

 #曖昧検索
  def self.fuzzy_search( search )
    where("title like ?", "%#{search}%")
  end

  #日付検索
  def self.date_search( date )
    target_date = Date.parse( date )
    record = []                                            #=>対象のレコード配列
    all.each do |enquete|
      comparison_date = enquete.created_at.to_date
      if comparison_date == target_date                    #=>全レコードから該当日付のレコード抽出
        record << enquete
      end
    end
    return record
  end
 


end
