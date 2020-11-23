class Customers::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @order = Order.new
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
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
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
  
end
