class AdminSessionsController < ApplicationController

	before_filter :save_admin_login_state, :only => [:new, :create]

	def new
	end

	def create
		admin = Admin.authenticate(params[:email], params[:password])
		if admin
			session[:admin_id] = admin.id
			redirect_to admin_home_path, :notice => "Logged in!"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:admin_id] = nil
		redirect_to log_in_path, :notice => "Logged out!"
	end
end
