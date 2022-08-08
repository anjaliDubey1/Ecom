class Api::V1::SellersController < Api::V1::ApiController
    def index
        @user=User.find(3)
        @product =@user.products
        render json: @product
    end
    def show
    end
    def new
        @user=User.find(3)
        @product = Product.new
    end
    def create
    end
    def edit
    end
    def update
    end
    def destroy
    end
end