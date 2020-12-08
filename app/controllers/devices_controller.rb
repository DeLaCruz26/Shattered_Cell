class DevicesController < ApplicationController
   before_action :redirect_if_not_logged_in

   def index
    @devices = Device.alpha
   end
   
   def new
      @device = Device.new
   end

   def create
      @device = Device.new(device_params)
      @device.user_id = session[:user_id]
      if @device.save
          flash[:message] = "Device Added!"
          redirect_to device_path(@device)
      else 
          render :new 
      end
  end

   def show
      @device = Device.find_by(params[:id])   
   end

  private

   def device_params
      params.require(:device).permit(:name, :model, :user_id)
   end

end
