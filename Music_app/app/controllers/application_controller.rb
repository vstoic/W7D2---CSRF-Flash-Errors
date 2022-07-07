class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?, :login(user)
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def require_logged_out
        redirect_to users
    end
    
    def logged_in?

    end

    def login(user)

    end

    def logout!

    end
end
