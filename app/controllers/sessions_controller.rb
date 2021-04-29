class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create

        @user = User.find_by(username: params[:username])
    
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash.now[:notice] = "Invalid credentails"
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
        byebug
        if user
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash.now[:notice] = "Invalid credentails"
            redirect_to '/login'
        end
    end

    

end