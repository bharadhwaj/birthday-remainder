class UsersController < ApplicationController
	before_action :is_logged_in, only: [:new]

	def index
	end

	# GET /users/new
	def new
		@user = User.new
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
