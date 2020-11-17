class Customers::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all.page(params[:page]).per(12)
  end
  
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
  
  
end
