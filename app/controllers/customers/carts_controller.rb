class Customers::CartsController < ApplicationController
  
  def show
    @cart_items = current_cart.cart_items
  end

  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
    end

    @cart_item.amount += params[:amount].to_i
    @cart_item.save
    redirect_to current_cart
  end

  def update_item
    @cart_item.update(amount: params[:amount].to_i)
    redirect_to current_cart
  end

  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end
  
  
  
  private
  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end
end
