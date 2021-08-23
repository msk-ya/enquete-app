# frozen_string_literal: true

module EnqueteDecorator
   def reception_status
    today = Date.today
    if self.limit >today
      return "<span style='background:blue'>受付中</span>".html_safe
    else
     return "<span style='background:red'>終了</span>".html_safe
    end
  end
  
  #期限の状況で回答ボタンを表示するか分岐
  def answer_button_existence
    today = Date.today
    if self.limit >today
      return "<a href='enquetes/#{self.id}/results' class='enquete-answer-button'>
               <img src='/svg/write_white.svg' width='20' height='20' style='color:white' />アンケートに答える
              </a>".html_safe
    else
     return "募集を終了しました。"
    end
    
  end
  
  
  
end
