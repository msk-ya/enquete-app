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
  
  
end
