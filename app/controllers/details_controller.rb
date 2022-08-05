class DetailsController < ApplicationController
     def index
         if current_user.seller==false
            redirect_to customers_index_path
        else
            redirect_to sellers_path
        end
        
     end
end
