class SessionsController < ApplicationController

    def omniauth
      @user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
        
        u.email = auth['info']['email']
        u.username = auth['info']['name']
        u.password = SecureRandom.hex(10)
      end
        if @user.save
           session[:user_id] = @user.id
           redirect_to new_comic_path
        else
          flash[:message] = user.errors.full_messages.join(", ")
          redirect_to comics_path
        end
    end

    def new

    end

    def create
        if user = User.authenticate(params[:username], params[:emal], params[:password])
          # Save the user ID in the session so it can be used in
          # subsequent requests
          session[:current_user_id] = user.id
          redirect_to root_url
        else
          redirect_to comic_path

        end
      end

      # def destroy
      #   session.delete :username
      #   redirect_to 
      # end

      private

      def auth
        request.env['omniauth.auth'] 
     end
 
 
end
