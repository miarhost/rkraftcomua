class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user.try(:authenticate, params[:password])
  		session[:user_id] = user.id 
  		redirect_to home_path 
  	else
  	 redirect_to new_user_session_path, alert: "No User with such credentials here"
  	end
  end

  def destroy
  end
end
