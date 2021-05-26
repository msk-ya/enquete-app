class EnquetesController < ApplicationController
  before_action :set_enquete, only: %i[ show edit update destroy ]

  # GET /enquetes or /enquetes.json
  def index
    @enquetes = Enquete.all
  end

  # GET /enquetes/1 or /enquetes/1.json
  def show
  end

  # GET /enquetes/new
  def new
    @enquete = Enquete.new
  end

  # GET /enquetes/1/edit
  def edit
  end

  # POST /enquetes or /enquetes.json
  def create
    @enquete = Enquete.new(enquete_params)

    respond_to do |format|
      if @enquete.save
        format.html { redirect_to @enquete, notice: "Enquete was successfully created." }
        format.json { render :show, status: :created, location: @enquete }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enquete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enquetes/1 or /enquetes/1.json
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

  # DELETE /enquetes/1 or /enquetes/1.json
  def destroy
    @enquete.destroy
    respond_to do |format|
      format.html { redirect_to enquetes_url, notice: "Enquete was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquete
      @enquete = Enquete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enquete_params
      params.require(:enquete).permit(:title, :content)
    end
end
