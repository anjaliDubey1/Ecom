class Api::V1::SessionsController < Api::V1::ApiController

    skip_before_action :verify_authenticity_token
    def create
       @user = User.where(email:params[:email]).first
       if @user && @user.valid_password?(params[:password])
         @token = SecureRandom.hex(10)
         @user.token=@token
         if @user.save
          render json: @user.token
         end
       else
         render json:{"error": "not login"}
       end
    end 
    def destroy
        @user=User.where(token: request.headers["token"]).first
        unless @user
            render json: {"message": "unauthorized"}
        else
            byebug
            @user.token=nil
            @user.save
            render json:{"message": "logout succesfull"}
       end
    end
end
#6c5085e20c0602be07e2