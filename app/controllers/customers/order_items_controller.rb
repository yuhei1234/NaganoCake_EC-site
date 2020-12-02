class Customers::OrderItemsController < ApplicationController
  def index
    @orders = Order.all
    @order_items = OrderItem.all.page(params[:page]).per(10)
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.all
    @order_items = OrderItem.find(params[:id])
  end
  
end
