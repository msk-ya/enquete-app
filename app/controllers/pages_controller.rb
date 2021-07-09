class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:top, :index, :area]
  layout 'page'

  def top
    
  end

  def index
    @enquetes = Enquete.all.desc_sort
  end

  def new
  end

  def show
  end

  def area
    puts params
  end
  
end
