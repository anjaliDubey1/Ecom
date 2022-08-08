class CartsController < ApplicationController
    def index
      @cart = Cart.all
    end
    def create
        @user=current_user
        @cart =@user.carts.create(cart_params)
        if @cart.save
           @cart.subtotal=(@cart.pro_stok).to_i*(@cart.pro_price).to_i
           @product= Product.find(@cart.product_id)
           
           @product.stok = @product.stok - @cart.pro_stok
           @product.save
           @cart.save
           redirect_to customers_index_path
          end
      end
      # def edit
      #   @cart = Cart.find(params[:id])
      # end
    
      def update
        @cart = Cart.find(params[:id])
        @oldstok =@cart.pro_stok
        @product= Product.find(@cart.product_id)
        if @cart.update(stok_params)
           @cart.subtotal=@cart.pro_price*@cart.pro_stok
          
          if @oldstok < @cart.pro_stok
              @newstok = @cart.pro_stok-@oldstok
              @product.stok= @product.stok-@newstok
              @product.save
              @cart.save
          else
            @newstok = @oldstok-@cart.pro_stok
            @product.stok = @product.stok + @newstok
            @product.save
            @cart.save
          end
          redirect_to customers_index_path
        end
      end
      def destroy
        @cart = Cart.find(params[:id])
        @product= Product.find(@cart.product_id)
        if @cart.destroy
           
           @product.stok = @product.stok + @cart.pro_stok
           @product.save
           redirect_to carts_path
           end
      end
      private
      def cart_params
        params.require(:product).permit(:pro_name, :pro_price,:pro_stok, :product_id,:sell_id)
      end
      def stok_params
        params.require(:cart).permit(:pro_stok)
      end
    
end
