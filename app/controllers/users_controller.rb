class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
            if @user.valid?
                @user.save
                if @user.teacher?
                    redirect_to teacher_path(@user)
                elsif @user.student?
                    redirect_to student_path(@user)
                elsif @user.admin?
                    redirect_to admin_path(@user)
                end
            else
                render :new
            end
    end
    
    def index 
        @users = User.all
    end

    def show
        find_user
    end

    def edit
        find_user
    end

    def update
        find_user
        if @user.update(user_params)
            if @user.teacher?
                redirect_to teacher_path(@user)
            elsif @user.student?
                redirect_to student_path(@user)
            elsif @user.admin?
                redirect_to admin_path(@user)
            end
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
