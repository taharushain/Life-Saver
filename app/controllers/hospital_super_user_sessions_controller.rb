class HospitalSuperUserSessionsController < ApplicationController
	
	before_filter :save_hospital_super_user_login_state, :only => [:new, :create]

	def new
	end

	def create
		hospital_super_user = HospitalSuperUser.authenticate(params[:user_name], params[:password])
		if hospital_super_user
			session[:hospital_super_user_id] = hospital_super_user.id
			redirect_to hospital_super_user_home_path, :notice => "Logged in!"
		else
			flash.now.alert = "Invalid user name or password"
			render "new"
		end
	end

	def destroy
		session[:hospital_super_user_id] = nil
		redirect_to log_in_path, :notice => "Logged out!"
	end
end
