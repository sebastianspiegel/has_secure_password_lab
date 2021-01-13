class SessionsController < ApplicationController

    def new 
    end

    def create
        user = User.find_by(name: params[:name])
        if user == nil || !user.authenticate(params[:password]) || params[:password] == nil || params[:password] == ""
            flash[:notice] = "Incorrect login"
            redirect_to new_session_path
        else
            @user = user 
            session[:user_id] = @user.id
            redirect_to homepage_path
        end
    end

end
