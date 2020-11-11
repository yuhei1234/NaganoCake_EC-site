class Customers::DeliversController < ApplicationController
  def index
    @delivers = Deliver.all
    @deliver = Deliver.new
  end
  
  def create
    deliver = Deliver.new(deliver_params)
    deliver.save
    redirect_to delivers_path
  end
  
  def edit
    @deliver = Deliver.find(params[:id])
  end
  
  def update
    deliver = Deliver.find(params[:id])
    deliver.update(deliver_params)
    redirect_to delivers_path
  end
  
  private
  def deliver_params
    params.require(:deliver).permit(:post_number, :address, :name)
  end
end
