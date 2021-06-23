class PagesController < ApplicationController
  layout 'page'
  def index
    @app = "my test"
  end

  def new
  end

  def show
  end
end
