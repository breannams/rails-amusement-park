require 'pry'
class UsersController < ApplicationController
     before_action :set_user, only:[:show, :edit, :update, :destroy]
    def show
        @user = User.find(params[:id])
        @message = params[:message] if params[:message]
        @message ||= false
    end


    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
        redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
      
        if @user.update_attributes(user_params)
            redirect_url = user_path(@user)
         else
            redirect_url = edit_user_path(@user)
        end
        redirect_to redirect_url
      #  binding.pry
    end

    private
    
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end