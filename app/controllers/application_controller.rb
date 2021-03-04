class ApplicationController < ActionController::Base
    before_action :verified_user
    private 

    def verified_user
        redirect_to "/" unless session[:user_id]
    end 

end
