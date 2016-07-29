class AmbulanceUsersController < ApplicationController
	before_filter :authenticate_admin_user, :only => [:new, :create, :index, :show, :edit, :update, :destroy]
	before_action :set_ambulance_user, only: [:show, :edit, :update, :destroy]


	def index
		@ambulance_users = AmbulanceUser.all		
	end

	def show	
	end

	def new
		@ambulance_user = AmbulanceUser.new
	end

	def create
		@ambulance_user = AmbulanceUser.new(ambulance_user_params)
		if(@ambulance_user.save)
			redirect_to admin_home_path, :notice => "Ambulance User Added"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @ambulance_user.update(ambulance_user_params)
			flash[:success] = "Ambulance User updated."
			redirect_to admin_home_path
		else
			flash.now[:alert] = "Ambulance User failed to update.  Please check the form."
			render :edit
		end
	end


	def destroy
		@ambulance_user.destroy
		flash[:success] = "Ambulance User has been deleted."

		redirect_to admin_home_path
	end


	private 

	def ambulance_user_params
		params.require(:ambulance_user).permit(:email,:belongs_to, :password_hash, :password_salt, :name, :password, :password_confirmation)
	end

	def set_ambulance_user
		@ambulance_user = AmbulanceUser.find(params[:id])
	end
end
