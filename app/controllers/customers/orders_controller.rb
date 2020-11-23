class Customers::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
    @cart_items = CartItem.all
    byebug
    @order.shipping_cost = 800
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    redirect_to costomers_cunfirm_path
  end
  
  def confirm
    @order = Order.find(params[:id])
    
  end
  
  def thanks
  end
  
  
  private
  def order_params
    params.require(:order).permit(:post_number, :address, :name, :total_price, :sipping_cost, :payment_method, :progress_status)
  end
  
  def deliver_params
    params.require(:deliver).permit(:name, :post_number, :address)
  end
end
