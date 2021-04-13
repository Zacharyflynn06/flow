class ApplicationController < ActionController::Base

    def current_user
        session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to controller: 'sessions', action: 'new' unless current_user
    end

end
