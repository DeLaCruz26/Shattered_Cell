class DevicesController < ApplicationController
   before_action :redirect_if_not_logged_in

   def index
    @devices = Device.alpha
   end
end
