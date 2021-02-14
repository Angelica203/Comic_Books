class SessionsController < ApplicationController

  def welcome
  end

  def new
      @user = User.new
  end

  # def create
  #    byebug
  #     if user = User.authenticate(params[:username], params[:password])
  #       session[:current_user_id] = user.id
  #       redirect_to user_path(user) 
  #     else     
  #       redirect_to '/login'
  #     end
  # end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to   '/welcome'     
    else
      flash[:message] = "Incorrect cradentials, please try again"
      redirect_to '/login' 
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
