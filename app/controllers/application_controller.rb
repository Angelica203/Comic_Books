class ApplicationController < ActionController::Base

  private
  
  def current_user
    session[:username][:email]
    # @current_user ||= session[:current_user_id] &&
    #   User.find_by(id: session[:current_user_id])
  end

   def require_logged_in
    redirect_to controller: 'sessions', action: 'new' unless current_user
   end
end
