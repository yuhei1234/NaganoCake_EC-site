class Managers::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order = Order.find(@order_item.order_id)
    @order_item.update(managers_order_item_params)
    
    if @order_item.making_status == "製作中"
      @order.update(progress_status: "製作中")
    end
    
    @order_item_finds = OrderItem.where(order_id: @order.id)
    @order.update(progress_status: "発送準備中") unless @order_item_finds.where(making_status: "製作中").exists?
        
    redirect_to managers_order_path(@order_item.order_id)
  end
  
  
  
  private
  def managers_order_item_params
    params.require(:order_item).permit(:making_status)
  end
  
end
