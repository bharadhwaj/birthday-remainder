class StaticPagesController < ApplicationController
	def index
		if !logged_in
			flash_message :warning, "Please log in and continue!!"
			redirect_to login_path
		end
	end
end
