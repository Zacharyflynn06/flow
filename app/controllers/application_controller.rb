class ApplicationController < ActionController::Base
    helper_method :current_user, :redirect_if_not_logged_in, :redirect_if_not_admin, :logged_in?, :redirect_if_not_authorized
    
    
    private

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to controller: 'sessions', action: 'new' unless logged_in?
    end

    def current_user
        User.find(session[:user_id])
    end
    
    def redirect_if_not_admin
        if !current_user.admin?
            redirect_to root_path, alert: "You are not authorized to complete this action"
        end
    end

    def redirect_if_not_authorized
        if current_user != params[:user_id]
            redirect_to root_path, alert: "You are not authorized to complete this action"
        end
    end



end
