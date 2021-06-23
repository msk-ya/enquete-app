class ResultsController < ApplicationController

  def index
    @results = Result.all
  end

  def show
    @enquete = Enquete.find( params[:id] )
    @resultDatas = @enquete.enquete_aggregate
    @texts = @resultDatas[0]
    @selects = @resultDatas[1]
    @text_titles = @enquete.enquete_titles(@texts)
    @select_titles = @enquete.enquete_titles(@selects)
    
  end

  def new
    @result = Result.new
    @enquete = Enquete.find( params[:enquete_id] )
    @questions = @enquete.questions
  end

  
  def edit
  end

  
  def create
  
    @enquete = Enquete.find( params[:enquete_id])
    @result = @enquete.results.new
    @questions = @enquete.questions
    @result.save_result(
      params[:enquete_id], 
      params[:text_title], 
      params[:select_title],  
      params[:edit], 
      params[:select], 
      params[:form_type]
    )
    if @result.save
      redirect_to root_path
    else
      render :new
    end
  end

  
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: "Result was successfully updated." }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: "Result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:result_data, :enquete_id)
    end
end
