class ApplicationController < ActionController::Base

    helper_method :user?, :user_profile, :user_is_a_buyer?, :current_user_and_article

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

        def user_is_a_buyer?
            if current_user.profile.user_card === 'Buyer'
                redirect_to root_path, alert: "You're not allowed to do this action. You are a buyer."
            end
        end

        def current_user_and_article
            @current_user_and_article = current_user
        end
end
