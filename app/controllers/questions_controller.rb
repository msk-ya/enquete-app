class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  protect_from_forgery :except => [:cancel]

  def new
    @question = Question.new
    @enquete = Enquete.find( params[:id] )
  end

  def create
    @enquete = Enquete.find( params[:question][:id] )
    @question = @enquete.questions.new( question_params )
    if @question.save
      redirect_to form_path(@question.id), notice: "質問を登録しました。"
    else
      render :new
    end
  end


  def delete
    question = Question.find( params[:id] )
    question.destroy
  end
  

  def show_modal
    @question = Question.find( params[:id] )
    @forms = @question.forms
  end


#途中で作成を取りやめた場合のキャンセル
  def cancel
     @question = Question.find(params[:question_id])
     @enquete = @question.enquete
     @question.destroy
     @enquete.destroy
  end
  
  

  private
    
    def set_question
      @question = Question.find(params[:id])
    end

  
    def question_params
      params.require(:question).permit(:content)
    end
end
