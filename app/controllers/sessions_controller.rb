class SessionsController < ApplicationController
    skip_before_action :verified_user

    def logout 
        session.clear
        redirect_to root_path
    end

    def login
        @user = User.new
    end
    
    def create
        @user = User.find_by_email(params[:email])
        if !@user
            @error = "Email is incorrect"
            render :login
        elsif @user.username != params[:username]
            if !@user.authenticate(params[:password])
                @error = "Username and Password are Incorrect"
            else
                @error =  "Username was Incorrect"
            end 
            render :login
        elsif !@user.authenticate(params[:password])
            @error =  "Password was Incorrect"
            render :login
        else 
            session[:user_id] = @user.id
            redirect_to artists_path 
        end 
    end

    def google
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user| 
            user.username = auth["info"]["name"]
            user.password = SecureRandom.hex(10)
        end 
        if @user && @user.id
            session[:user_id] = @user.id
            redirect_to artists_path 
        else 
            redirect_to root_path
        end 
    end

    private 

    def auth
        request.env['omniauth.auth']
    end 
end