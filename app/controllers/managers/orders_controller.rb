class Managers::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
    @order_items = OrderItem.all
  end
  
  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    
    @order_items = OrderItem.all
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(managers_order_params)
    redirect_to managers_order_path(@order)
  end
  
  private
  def managers_order_params
    params.require(:order).permit(:progress_status)
  end

end
