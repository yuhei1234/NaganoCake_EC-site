class Customers::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all.page(params[:page]).per(12)
  end
  
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end
  
end
