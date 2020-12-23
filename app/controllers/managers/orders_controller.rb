class Managers::OrdersController < ApplicationController
  def index
    @orders = Order.order("id DESC").page(params[:page]).per(10)
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
    if @order.progress_status == "入金確認"
      @order_items = OrderItem.all
      @order_items.each do |order_item|
        if @order.id == order_item.order_id
          order_item.update(making_status: "製作待ち")
        end
      end
    end
    redirect_to managers_order_path(@order)
  end
  
  private
  def managers_order_params
    params.require(:order).permit(:progress_status)
  end

end
