class SessionsController < ApplicationController
def index
@p=Post.all
end
  def create
    adm = Adm.find_by(params[:name])
    if adm && adm.authenticate(params[:password])
     session[:adm_id] = adm.id
    redirect_to '/posts'
   
    #redirect_to '/login'
   else

    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
     if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/posts'
    else
    # If user's login doesn't work, send them back to the login form.
     	 redirect_to '/login'
    end
  end
  end

  def destroy
    session[:user_id] = nil
    session[:adm_id] = nil
    redirect_to '/login', :notice => "logged out succesfully"
  end
end
