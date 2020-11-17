class Customers::OrderItemsController < ApplicationController
  def new
    @orders = Order.all
    @delivers = Deliver.all
  end
  
  def create
    @order_item = OrderItem.new(order_item_params)
    redirect_to new_order_item_path
  end
  
  def confilm
  end
  
  def thanks
  end
  
  private
  def order_item_params
    params.permit(:order_id, :item_id, :price, :amount, :making_status)
  end
end