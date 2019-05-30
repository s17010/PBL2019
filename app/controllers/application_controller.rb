class ApplicationController < ActionController::Base

	def authenticate_user
		if session[:user_id] == nil
			flash[:notice] = "ログインが必要です"
			redirect_to("/login")
		end
	end
	
	def is_login
		if @current_user
			flash[:notice] = "ログイン済"
			redirect_to("/posts")
		end
	end

end
