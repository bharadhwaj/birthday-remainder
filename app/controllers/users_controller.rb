class UsersController < ApplicationController
	
	# GET /users/1
  	# GET /users/1.json
	def show
		@user = User.find(params[:id])
	end

	def index
	end

	# GET /users/new
	def new
		if logged_in
	      flash_message :info, "You are already logged in!"
	      redirect_to root_path
	    else
			@user = User.new
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash_message :success, "You have succesfully signed in!"
			redirect_to root_path	
		else
			@user.errors.full_messages.each do |message|
				flash_message :danger, message
			end
			redirect_to signup_path
		end
	end

	private
		def user_params
	      params.require(:user).permit(:name, :email, :dob, :password, :password_confirmation)
	    end
end
