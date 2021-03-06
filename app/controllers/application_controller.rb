class ApplicationController < ActionController::Base
    before_action :authorize, except: [:home]
    

    def current_user 
        @current_user = User.find_by(id: session[:user_id])
    end 

    def authorize
        if !current_user
            redirect_to login_path
            flash[:authorization_message] = "You are not authorized for that page, please log in or sign up."
        end
    end
    
    def home

    end

end

# if !current_user
#     redirect_to root_path
#     flash[:authorization_message] = "You are not logged in or have an account, so we navigated you back to the home page"
# end