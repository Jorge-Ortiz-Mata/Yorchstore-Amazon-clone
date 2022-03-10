class ApplicationController < ActionController::Base

    helper_method :user?

    private 
        def user?
            if !current_user
                redirect_to new_user_session_path
            end
        end

        def user_profile
            if current_user.profile.nil?
                redirect_to new_profile_path, notice: "Now please, create your own profile."
            end
        end

end
