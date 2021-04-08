class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update]
    before_action :logged_in?



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

    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :role, :email, :password, :first_name, :last_name, :years_experience, :bio)
    end


end
