class Customers::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.new
  end
  
  def create
    if customer_signed_in?
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      
      if @cart_item.amount == nil
        redirect_to item_path(@cart_item.item_id)
        flash[:amount_error] = "＊個数を選択＊"
      else
        @cart_item.save
        redirect_to cart_items_path
      end
    else
      redirect_to new_customer_session_path
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
