class UsersController < ApplicationController

    def index 

    end 
    
    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to @user
        else 
            render :new
        end
    end 

    def show 
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end 

    def destroy 
        @user = User.find_by_id(params[:id]) 
        @user.destroy 
        redirect_to '/signup'
    end 

    private 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end     
end
