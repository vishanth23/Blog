class UsersController < ApplicationController
def index
	
#@users=User.where("name LIKE ?","%#{params[:Search]} %")
end
def new
end

def create
  user = User.new(user_params)
  if user.save
  	redirect_to users_path
    #session[:user_id] = user.id
    #redirect_to '/login'`
  else
    redirect_to '/signup'
  end
end
private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
end 


