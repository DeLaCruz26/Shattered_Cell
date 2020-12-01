class CustomersController < ApplicationController

    def new 
        @customer = Customer.new 
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            session[:user_id] = @customer.id 
            redirect_to customer_path(@customer)
        else
            render :new
        end
    end

    def show
        @customer = Customer.find_by(params[:id])
        @repairs = @customer.repairs 
    end

    private

    def customer_params
        params.require(:customer).permit(:name, :password, :device)
    end

end
