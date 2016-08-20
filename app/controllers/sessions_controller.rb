class SessionsController < ApplicationController
  before_action :is_logged_in, only: [:new]
  before_action :is_logged_out, only: [:destroy]

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
      flash_message :success, "You have successfully logged in!"
  		redirect_to root_path
  	else
  		flash_message_now :warning, "Invalid Email ID - Password combination."
  		render 'new'
  	end
  end

  def destroy
      log_out
      flash_message :success, "You have successfully logged out!"
      redirect_to login_path
  end
end
