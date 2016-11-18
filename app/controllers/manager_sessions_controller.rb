class ManagerSessionsController < ApplicationController
	before_filter :save_manager_login_state, :only => [:new, :create]

	def new
	end

	def create
		manager = Manager.authenticate(params[:user_name], params[:password])
		if manager
			session[:manager_id] = manager.id
			redirect_to root_path, :notice => "Logged in!"
		else
			flash.now.alert = "Invalid user name or password"
			render "new"
		end
	end

	def destroy
		session[:manager_id] = nil
		redirect_to log_in_path, :notice => "Logged out!"
	end
end
