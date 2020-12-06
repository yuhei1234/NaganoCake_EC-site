class CustomersController < ApplicationController
  def top
    @genres = Genre.all
  end
  
  def about
  end
  
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_path
  end
  
  def confirm
    @customer = current_customer
  end
  
  def hide
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会手続きが完了しました。ご利用ありがとうございました。"
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_number, :address, :phone_number)
  end
end
