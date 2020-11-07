class Managers::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    order = Order.find(params[:id])
    order.update(managers_order_params)
    redirect_to managers_order_path(order)
  end
  
  private
  def managers_order_params
    params.require(:orders).permit(:progress_status)
  end

end
