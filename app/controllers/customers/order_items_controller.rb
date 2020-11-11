class Customers::OrderItemsController < ApplicationController
  def new
    @order_item = OrderItem.new
  end
  
  def create
    order_item = OrderItem.new(order_item_params)
    order_item.save
    redirect_to customers_order_item_confilm_path
  end
  
  def confilm
  end
  
  def thanks
  end
end
