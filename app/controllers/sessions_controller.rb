class SessionsController < ApplicationController

    def create
    user = User.find(params)
    end

    def create
        if user = User.authenticate(params[:username], params[:emal], params[:password])
          # Save the user ID in the session so it can be used in
          # subsequent requests
          session[:current_user_id] = user.id
          redirect_to root_url
        end
      end
end
