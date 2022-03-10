class ApplicationController < ActionController::Base

    helper_method :user?

    private 
        def user?
            if !current_user
                redirect_to new_user_session_path, alert: "You must sign in."
            end
        end

end
