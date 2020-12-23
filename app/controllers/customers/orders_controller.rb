class Customers::OrdersController < ApplicationController
  def index
    @orders = Order.where(customer_id: current_customer.id).order("id DESC").page(params[:page]).per(10)
    @order_items = OrderItem.all
  end
  
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    
    @cart_items = CartItem.where(customer_id: current_customer.id)
    
    @delivers = Deliver.where(customer_id: current_customer.id)
  end
  
  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @delivers = Deliver.where(customer_id: current_customer.id)
    
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    if params[:order][:address_select] == "0"
      @order.address = current_customer.address
      @order.post_number = current_customer.post_number
      @order.name = (current_customer.last_name + current_customer.first_name)
    elsif params[:order][:address_select] == "1"
      if params[:order][:address_id] != ""
        @order.address = Deliver.find((params[:order][:address_id]).to_i).address
        @order.post_number = Deliver.find((params[:order][:address_id]).to_i).post_number
        @order.name = Deliver.find((params[:order][:address_id]).to_i).name
      else
        redirect_to new_order_path
        flash[:deliver_error] = "＊配送先を選択＊"
      end
    else
      if @order.address == "" || @order.post_number == "" || @order.name == ""
        redirect_to new_order_path
        flash[:new_order_address_error] = "＊新しいお届け先を入力＊"
      end
    end
    
    @orders = Order.where(customer_id: current_customer.id)
    
    @order_items = OrderItem.all
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    
    @order.save
    if @order.save
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = cart_item.item.id
        @order_item.price = cart_item.item.price
        @order_item.amount = cart_item.amount
        @order_item.save
        cart_item.destroy
      end
    end
    
    redirect_to thanks_orders_path
  end
  
  def thanks
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.all
  end
  
  
  private
  def order_params
    params.require(:order).permit(:post_number, :address, :name, :total_price, :shipping_cost, :payment_method, :progress_status)
  end
  
end
