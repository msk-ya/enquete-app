class PagesController < ApplicationController
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
end
