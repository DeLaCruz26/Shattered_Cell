class RepairsController < ApplicationController

    def new
        @repair = @user.repair.new
    end


    def create
        @repair = Repair.new(repair_params)
        if @repair.save
            flash[:message] = "Repair Scheduled!"
            redirect_to customer_path(@repair.user)
        else 
            render :new 
        end
    end

    def index
        @repairs = @user.repairs
    end

    def show
        @repair = Repair.find_by(params[:id])
    end

    private

    def repair_params
        params.require(:repair).permit(:repair_time, :repair_description, :user_id)
    end 
end
