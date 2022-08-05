class SellersController < ApplicationController
  def index
    @user=current_user.products
  end

  def show
    @product =Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @user = current_user
    @product = @user.products.new(product_params)
    if @product.save
      redirect_to sellers_path
    else
      render :new
    end
  end
    def edit
      @product = Product.find(params[:id])
    end
  
    def update
      @product = Product.find(params[:id])
  
      if @product.update(product_params)
        redirect_to sellers_path
      else
        render :edit
      end
    end
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
  
      redirect_to sellers_path
    end
  private
  def product_params
    params.require(:product).permit(:name, :price,:stok)
  end

 end
