class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:top, :index, :area]
  layout 'page'

  def top
    
  end

  def index
    if params[:search]                                       #=>キーワード検索ありの場合
      @enquetes = Enquete.fuzzy_search( params[:search] )

    elsif params[:date]                                      #=>日付検索ありの場合
      @enquetes =Enquete.date_search( params[:date] )

    else
      @enquetes = Enquete.all.desc_sort                      #=>デフォルト
    end
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
