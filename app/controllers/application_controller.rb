class ApplicationController < ActionController::Base
    helper_method :current_user, :redirect_if_not_logged_in, :redirect_if_not_admin
    private

    def redirect_if_not_logged_in
        redirect_to controller: 'sessions', action: 'new' unless session[:user_id]
    end

    def current_user
        if session[:user_id]
            current_user = User.find(session[:user_id])
            current_user
        end
    end
    
    def redirect_if_not_admin
        redirect_back(fallback_location: root_path) unless current_user.admin?
    end

end
