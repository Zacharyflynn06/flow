class UsersController < ApplicationController

    before_action :redirect_if_not_logged_in, only: [:edit, :update, :destroy]
    before_action :redirect_if_not_authorized, only: [:edit, :update, :destroy]
    before_action :find_user, only: [:show, :edit, :update]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
            render :new
        end
    end
    
    def index 
        @users = User.all
    end

    def show
        
    end

    def edit
        
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
    end

    private

    def find_user
        if @user = User.find_by(id: params[:id])
            @user
        else
            redirect_to users_path, alert: "User doesn't exist!"
        end
    end

    def user_params
        params.require(:user).permit(:username, :role, :email, :password, :first_name, :last_name, :years_experience, :bio, :password_confirmation, :avatar)
    end


end
