class OrdersController < ApplicationController
    def index
        @orders=current_user.orders
        #byebug
    end

    def create
       @carts=current_user.carts
        @total=0
        # byebug
        @carts.each do |cart|
            @total=@total+cart.subtotal
        end
        @order=current_user.orders.new(TotalPrice: @total)
        if @order.save
            @carts.each do |cart|
                @product_id=cart.product_id
                @stok=cart.pro_stok
                @subtotal=cart.subtotal
                @order_details=@order.order_details.new(Product_id: @product_id, stok: @stok, subtotal: @subtotal)
                @order_details.save
            end
            @carts.destroy_all
            redirect_to  orders_path
            
        end
    end
    
    def show
        @order=Order.find(params[:id])
        @order_details=@order.order_details
    end
end
