class SessionsController < ApplicationController

  def welcome
    if logged_in?
      redirect_to user_path(current_user)
    end
  end

  def new
      @user = User.new
  end

  def create
      if user = User.authenticate(params[:username], params[:email], params[:password])
          # Save the user ID in the session so it can be used in
          # subsequent requests
        session[:current_user_id] = user.id
        redirect_to   user_path(user)      #root_url
      else
        redirect_to comic_path

      end
  end

   def destroy
        session.delete(:user_id)
        redirect_to '/login'
   end


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
  
      private

      def auth
        request.env['omniauth.auth'] 
     end
 
 
end
