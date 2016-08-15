class FriendsController < ApplicationController
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
		@friend = Friend.find(params[:id])
	end

	def search
		# @friend = Friend.find(params[:id])
		# render 'edit'
		redirect_to edit_friend_path(params[:id])
	end

	def update
		@friend = Friend.find(params[:id])
		if @friend.update(friend_params)
			flash_message :success, "User details updated successfully.!"
			redirect_to root_path
		else
			flash_message :danger, "Updation failed.!"
			render 'edit'
		end
	end

	private
		def friend_params
			params.require(:friend).permit(:name, :dob, :email)
		end

		def friend_id
			params.require(:friend).permit(:id)
		end
end
