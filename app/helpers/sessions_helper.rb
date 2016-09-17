module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in
		!current_user.nil?
	end

	def is_logged_in
		if logged_in
	      flash[:info] = "You are already logged in!"
	      redirect_to root_path
	  	end
	end

	def is_logged_out
		if !logged_in
      		flash[:warning] = "Please log in to continue!"
      		redirect_to login_path
	  	end
	end
	
	def log_out
	    session.delete(:user_id)
	    @current_user = nil
	end

end
