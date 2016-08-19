class FriendsController < ApplicationController
	before_action :set_friend, only: [:edit, :update, :destroy]
	def index
		@friends = Friend.where(user_id: session[:user_id])
	end

	def new
		@friend = Friend.new
	end

	def create
		@friend = Friend.new(friend_params)
		@friend.user_id = session[:user_id]
		if @friend.save
			flash_message :success, "New friend successfully addedd!"
			redirect_to root_path	
		else
			@friend.errors.full_messages.each do |message|
				flash_message :danger, message
			end
			# redirect_to new_friend_path
			render 'new'
		end
	end

	def edit
	end

	def search
		redirect_to edit_friend_path(params[:id])
	end

	def update
		if @friend.update(friend_params)
			flash_message :success, "User details updated successfully.!"
			redirect_to root_path
		else
			flash_message :danger, "Updation failed.!"
			render 'edit'
		end
	end

	def destroy
		@friend.destroy
		flash_message :success, "User deleted successfully.!"
		redirect_to friends_path
	end

	private
		def set_friend
			@friend = Friend.find(params[:id])
		end

		def friend_params
			params.require(:friend).permit(:name, :dob, :email, :birthday_message)
		end
end
