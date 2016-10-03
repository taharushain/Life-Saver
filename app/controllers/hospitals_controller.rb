class HospitalsController < ApplicationController

	before_filter :authenticate_admin_user, :only => [:index, :show, :new, :create, :edit, :update, :destroy]
	before_action :set_hospital, only: [:show, :edit, :update, :destroy]
	
	def index  
		@hospitals = Hospital.all
	end


	def show
	end

	def new
		@hospital = Hospital.new  
	end 

	def create
		@hospital = Hospital.new(hospital_params)

		if @hospital.save
			flash[:success] = "Your hospital has been added!"
			redirect_to @hospital
		else
			flash.now[:alert] = "Your hospital couldn't be added!  Please check the form."
			render 'new'
		end

	end


	def edit
	end

	def update
		if @hospital.update(hospital_params)
			flash[:success] = "Hospital updated."
			redirect_to admin_home_path
		else
			flash.now[:alert] = "Hospital failed to update.  Please check the form."
			render :edit
		end
	end


	def destroy
		@hospital.destroy
		flash[:success] = "Hospital has been deleted."

		redirect_to admin_home_path
	end


	private

	def hospital_params  
		params.require(:hospital).permit(:name, :logo, :address)
	end  

	def set_hospital
		@hospital = Hospital.find(params[:id])
	end
end
