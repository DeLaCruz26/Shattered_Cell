class SessionsController < ApplicationController
    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.find_by_id(params[:customer_name])
        
        if @customer && @customer.authenticate(params[:password])
          session[:user_id] = @customer.id
          redirect_to customer_path(@customer)
        else
          flash[:message] = "Incorrect Password"
          all_customers
          render :new
        end
      end
    
      def destroy
        session.delete
        redirect_to root_path
      end
    
      private
    
      def all_customers
        @customer = Customer.all
      end
end
