class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  #def authorize
   # redirect_to '/login' unless current_user
  #end

def admin_user
@admin_user ||= Adm.find(session[:adm_id]) if session[:adm_id]
end
helper_method :admin_user
end

	