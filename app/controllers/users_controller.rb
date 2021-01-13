class UsersController < ApplicationController

    def new
    end

    def create
        if params[:user][:password] != params[:user][:password_confirmation]
            flash[:notice] = "Passwords must match."
            redirect_to new_user_path
        else
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to '/homepage'
        end
    end

    def homepage
        @user = current_user
    end

    private

    def current_user
        User.find(session[:user_id])
    end

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end