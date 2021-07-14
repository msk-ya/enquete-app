class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:top, :index, :area]
  layout 'page'

  def top
    
  end

  def index
    @enquetes = params[:search] ? Enquete.fuzzy_search( params[:search] ) :  Enquete.all.desc_sort
  end
  

  def new
  end

  def show
  end

  def area
    if params[:area].present?
      @enquetes = Enquete.where(area: params[:area])
    else
       @enquetes = Enquete.all
    end
  end
  
end
