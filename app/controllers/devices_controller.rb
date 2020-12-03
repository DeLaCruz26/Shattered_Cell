class DevicesController < ApplicationController
    include SessionsHelper
    
    def new
        @device = Device.new
    end

    def create
        @device = Device.new(device_params)
        if @device.save
            session[:user_id] = @device.id
            redirect_to device_path(@device)
        else
            render :new
        end
    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def device_params
        params.require(:device).permit(:name, :model, :user_id, :repair_id)
    end
end
