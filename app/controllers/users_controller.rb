class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:signup, :create]

    def signup
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to artists_path
        else 
            flash.now[:error] = @user.errors.full_messages
            render :signup
        end 
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
end