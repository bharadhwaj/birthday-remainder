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
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			#BirthdayMailer.send_birthday_mail(@user).deliver
			flash[:success] = "You have succesfully signed in!"
			redirect_to users_path	
		else
			render 'new'
		end
	end

	private
		def user_params
	      params.require(:user).permit(:name, :email, :dob, :password, :password_confirmation)
	    end
end
