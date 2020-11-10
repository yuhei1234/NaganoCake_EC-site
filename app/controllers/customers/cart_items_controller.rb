class Customers::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.find(params[:id])
  end
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(params_cart_item)
    redirect_to customers_cart_items_path
  end
  
  def destroy
    @cart_items = CartItem.all
    @cart_item = CartItem.find(params[:id])
    @cart_items.destroy
    @cart_item.destroy
    redirect_to customers_cart_items_path
  end
  
  private
  def params_cart_item
    params.require(:cart_item).permit(:amount)
  end
end
