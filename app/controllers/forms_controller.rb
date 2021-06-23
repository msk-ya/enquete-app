class FormsController < ApplicationController
  protect_from_forgery
  before_action :set_form, only: %i[ show edit update destroy ]

  def new
    @form = Form.new
    @question = Question.find( params[:id] )
    @count = 2
  end

  def edit
  end
  

#フォーム追加
  def create
    @form = Form.new
    datas = params[:form][:check]

    if datas
      str= ""   #=>content格納の文字列
      str += params[:form][:content].to_s
      datas.each do |data|
        str += "," + data[:content].to_s
      end
      @form.select_question( params[:form][:id], str)
    else
       @form.edit_question( params[:form][:id], params[:form][:content])
    end
   
    if @form.save
       redirect_to root_path
    else
      render :new
    end
  end

  #削除操作
 def delete
   form = Form.find( params[:id] )
   form.delete_item(params[:title].to_i)
 end
 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def form_params
      params.require(:form).permit(:html, :question_id)
    end
end
