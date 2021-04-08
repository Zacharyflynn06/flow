class SessionsController < ApplicationController

    def new
    
        @user = User.new
    end

    def create
        byebug
        @user = User.find_by(username: params[:username])
        byebug
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id           
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

    def show

    end

    def destroy
        session.delete
    end

end