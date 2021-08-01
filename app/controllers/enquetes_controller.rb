class EnquetesController < ApplicationController
  before_action :set_enquete, only: %i[ show edit update destroy ]

  
  def index
    @enquetes = current_user.enquetes
  end

  def show
     @enquete = Enquete.find( params[:id] )
     @enquete.enquete_aggregate
    
  end

  
  def new
    @enquete = Enquete.new
    if params[ :user_id ]
      @user = User.find( params[:user_id] )
    else
      redirect_to root_path, notice: "ログインしてご利用ください。"
    end
  end

 
  def edit
  end


  def create
    @enquete = Enquete.new(enquete_params)
    if @enquete.save
      redirect_to question_path(@enquete.id), notice: "質問を入力してください。"
    else
      render :new
    end
  end

  
  def update
    respond_to do |format|
      if @enquete.update(enquete_params)
        format.html { redirect_to @enquete, notice: "Enquete was successfully updated." }
        format.json { render :show, status: :ok, location: @enquete }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enquete.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    enquete = Enquete.find( params[:id] )
    enquete.destroy
  end

  def top
    @enquete = Enquete.first
    @question = @enquete.questions.all
    
  end

  def answer
    debugger
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquete
      @enquete = Enquete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enquete_params
      params.require(:enquete).permit(:title, :content, :limit, :area, :user_id)
    end
end
