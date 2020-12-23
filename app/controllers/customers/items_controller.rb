class Customers::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    
    if params[:genre_select] != nil
      @items = Item.where(genre_id: params[:genre_select].to_i)
    elsif params[:search] != nil
      @items = Item.where("name LIKE ?", "%#{params[:search]}%")
    else
      @items = Item.all
    end
  end
  
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  
end
