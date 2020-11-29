class Customers::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    
    @cart_items = CartItem.all
    
    @delivers = Deliver.all
  end
  
  def confirm
    @cart_items = CartItem.all
    
    @order = Order.new(order_params)
    if params[:order][:address_select] == "0"
      @order.address = current_customer.address
      @order.post_number = current_customer.post_number
      @order.name = (current_customer.last_name + current_customer.first_name)
    elsif params[:order][:address_select] == "1"
      @order.address = Deliver.find((params[:order][:address_id]).to_i).address
      @order.post_number = Deliver.find((params[:order][:address_id]).to_i).post_number
      @order.name = Deliver.find((params[:order][:address_id]).to_i).name
    else
    end
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    
    @orders = Order.all
    
    @order_items = OrderItem.all
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    
    @order.save
    if @order.save
      @order_item = OrderItem.new
      @order_item.order_id = @order.id
      @order_item.item_id = @cart_item.item.id
      @order_item.price = @order.total_price
      @order_item.amount = 0
      @cart_items.each do |cart_item|
        @order_item.amount += cart_item.amount
      end
      @order_item.save
    end
    
    if @order_item.save
      @cart_item.destroy
    end
    
    redirect_to thanks_orders_path
  end
  
  def thanks
  end
  
  
  private
  def order_params
    params.require(:order).permit(:post_number, :address, :name, :total_price, :shipping_cost, :payment_method, :progress_status)
  end
  
end
