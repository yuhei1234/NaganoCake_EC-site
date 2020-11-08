class CustomersController < ApplicationController
  def top
    @genres = Genre.all
  end
end
