class Form < ApplicationRecord
  belongs_to :question

  #入力型フォーム
  def edit_question(id, content)
    question = Question.find(id)
    html = "
       <p class='text-center text-primary'>#{content}</p>
       <input type='hidden' name='text_title[][title]' value=#{question.content} />
       <input type='hidden' name='form_type[][type]' value=0 />
       <textarea name='edit[][text]' rows='4'　required　 class='answer-text'></textarea>
    "
    self.html = html
    self.title = content
    self.form_type = 0
    self.question_id = id
  end

  #選択型フォーム
  def select_question(id, params)
    question = Question.find id
    array = params.split(",");
    html = "<h4>#{array[0]}</h4>"
    html += "<input type='hidden' name='select_title[][title]' value=#{question.content} />"
    html += "<input type='hidden' name='form_type[][type]' value=1 />"
    array.each_with_index do |param,index|
      if index > 0
        html += "
               <input type='radio' name='select[][text#{question.id}]' id='check#{question.id}[#{index}]' value='#{param}' />
               <label for='check#{question.id}[#{index}]'>#{param}</label><br>
        "
        html += " <input type='radio' name='select[][text#{question.id}]' value='#{id}' checked='checked' style='display:none' />"
      end
    end
    self.html = html
    self.title = params
    self.form_type = 1
    self.question_id = id
  end

  #選択フォームか入力フォームかをtitleのカウントで判別
  def form_type
    form_count = title.split(",").count
    return form_count
  end
  
  #選択アイテム削除
  def delete_item(id)
    newContents = ""
    html = ""

    contents = self.title.split(',')
    contents.delete_at(id + 1);    #=>選択してくださいを省くため+1
    contents.each do |content|
      newContents += content + ","
    end
    html = "<h4>#{contents[0]}</h4>";
    contents.each_with_index do |param,index|
      if index > 1
        html += "
               <input type='radio' name='edit[][text]' id='check[#{index}]' value='#{param}' />
               <label for='check[#{index}]'>#{param}</label><br>
        "
      end
    end
    self.title = newContents
    self.html = html
    self.save

  end
  ###########################################################
  ##選択タイプのアンケートの集計の雛形の配列を作成する
  
  def self.SelectItems
    array = []                           #=>全選択型フォーム分の総合配列
    all.each do |form|
       hash = {}                         #=>各選択型フォームのアイテムのハッシュ
       data = form.title.split(',')
       if data.count >1
         data.each do |dt|
            hash[dt] = 0
         end
         hash.present? ?array.push(hash) : ""
       end
    end
    return array
  end
  
end
