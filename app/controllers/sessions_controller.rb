class SessionsController < ApplicationController

    def home 
    end

    def new
    end

    def create
      if params[:provider] == 'google_oauth2'
        @user = user.google_login(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:message] = "Incorrect Password"    
          redirect_to '/login'
        end
      end
    end

    def google_login
      user_email = request.env['omniauth.auth']['info']['email']
      user_name = request.env['omniauth.auth']['info']['name']
      @user = User.find_or_create_by(email: user_email) do |user|
        user.username = user_name
        user.password = SecureRandom.hex
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
    
    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def auth
      request.env['omniauth.auth']
    end
end