class StaticPagesController < ApplicationController
	before_action :is_logged_out, only: [:index]
	
	def index
		@friend = Friend.new
	end

	def page_not_found
	end
end
