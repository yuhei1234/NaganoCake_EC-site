class Managers::OrderItemsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_item = OrderItem.find(params[:id])
    @order_item.update(managers_order_item_params)
    redirect_to managers_order_path(@order_item.order_id)
  end
  
  
  
  private
  def managers_order_item_params
    params.require(:order_item).permit(:making_status)
  end
  
end
