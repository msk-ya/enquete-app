class Result < ApplicationRecord
  belongs_to :enquete
  serialize :text_title, Array
  serialize :select_title, Array
  serialize :content, Array
  serialize :select, Array
  serialize :form_types, Array


#************************************アンケート登録**********************************************************************
  #アンケートの登録作業

  def save_result(id, text_titles, select_titles,  texts,  selects,  form_type)
    result_text_title = []
    result_select_title = []
    result_text_content = []
    result_select_content = []
    result_types = []
    
    

    if text_titles.present?
      #テキストタイプの質問の登録
      text_titles.each do |title|
        result_text_title.push( title[:title] )    
      end
      #入力タイプ内容登録

      texts.each do |text|
        result_text_content.push(text[:text])
      end
    end

  #################################################################

    if select_titles.present?
       #選択タイプの質問の登録
  
       select_titles.each_with_index do |title|
          record_array = []
          result_select_title.push( title[:title] )

          #選択タイプ内容集計
          
          keys = selects[0].keys                                   #=>送信されてきたselectパラメーターのキーで分割し数の確保
          keys.each_with_index do |key, i|
            string = ""
            id = key.split("text")[1]                              #=>送信パラメータのキーを分解しid取得
            value = selects[0][key]                                #=>送信パラメーターのvalue を取得
            question = Question.find id
            question_select = question.forms.first                 #=>関連する質問の選択肢を確保
            question_select.title.split(",").each do |title|       #=>その選択肢に数量があるかチェック
              if value == title
                string += "#{title}:1,"
              else
                 string += "#{title}:0,"
              end                                                  #=>if分 each 
            end                                                    #=>titles each 
             result_select_content.push(string)                    #=>送信されたパラメータの数を反映させ、formレコード分配列の格納
          end                                                      #=>keys each
       end                                                         #=>select each
    end

   
  ####################################################
  #フォームタイプ登録

    form_type.each do |type|
      result_types.push(type[:type])
    end

  
    self.text_title = result_text_title
    self.select_title = result_select_title
    self.content = result_text_content
    self.select = result_select_content
    self.form_types = result_types
  end

  #************************************アンケート登録終了**********************************************************************


  
end
