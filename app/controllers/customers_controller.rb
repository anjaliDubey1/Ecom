class CustomersController < ApplicationController
  def index
    @product= Product.all
  end
   
end
