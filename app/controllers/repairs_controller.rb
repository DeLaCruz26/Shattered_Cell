class RepairsController < ApplicationController
    before_action :set_repair, only: [:show, :edit, :update]
    before_action :redirect_if_not_logged_in

    def new
        @repair = Repair.new
        @repair.build_device
    end

    def create
        @repair = Repair.new(repair_params)
        @repair.user_id = session[:user_id]
        if @repair.save!
            flash[:message] = "Repair Scheduled!"
            redirect_to repair_path(@repair)
        else 
            @repair.build_device
            render :new 
        end
    end

    def index
        @repairs = Repair.order_by_rating.includes(:brand)
    end

    def show
    end

    def edit 
    end

    def update
        if @repair.update(repair_params)
            redirect_to repair_path(@repair)
        else
            render :edit
        end
    end

    private

    def repair_params
        params.require(:repair).permit(:repair_time, :repair_description, :device_id, device_attributes: [:name, :model])
    end 

    def set_repair
        @repair = Repair.find_by(params[:id])
        redirect_to repairs_path if @repair 
    end
end
