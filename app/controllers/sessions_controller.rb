class SessionsController < ApplicationController
  def new
    if logged_in
      flash_message :info, "You are already logged in!"
      redirect_to root_path
    end
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
      flash_message :success, "You have successfully logged in!"
  		redirect_to root_path
  	else
  		flash_message_now :danger, "Invalid email/password combination"
  		render 'new'
  	end
  end

  def destroy
    if !logged_in
      flash_message :warning, "Please log in and continue!"
      redirect_to login_path
    else
      log_out
      flash_message :success, "You have successfully logged out!"
      redirect_to login_path
    end
  end
end
