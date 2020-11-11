class CustomersController < ApplicationController
  def top
    @genres = Genre.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to "customers#top"
  end
end
