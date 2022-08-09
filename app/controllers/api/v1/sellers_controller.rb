class Api::V1::SellersController < Api::V1::ApiController
    skip_before_action :verify_authenticity_token
    def index
        @user=User.find(3)
        @product =@user.products
        render json: @product
    end
    def show
       #@user=User.find(3)
        @product =Product.find(params[:id]) 
        render json: {status:"Success",message:"loaded product",data:@product},status: :ok
    end
    def create
      @user=User.find(3)
      @product =  @user.products.new(product_params)
      if @product.save
        render json: {status:"Success",message:"successfully saved",data:@product},status: :ok
      else
        render json: {status:"error",message:"not saved",data:@product.errors}
      end
    end
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            render json: {status:"Success",message:" updated successfully ",data:@product},status: :ok
        else
            render json: {status:"error",message:"not update",data:@product.errors}
        end
    end
    def destroy
        @product =Product.find(params[:id]) 
        @product.destroy
        render json: {status:"Success",message:" Delete successfully ",data:@product},status: :ok
    end
    private
    def product_params
        params.permit(:name,:price,:stok)
    end
end