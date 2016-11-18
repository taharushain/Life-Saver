class BedsController < ApplicationController
	before_action :authenticate_hospital_super_user
	before_action :set_bed, only: [:show, :edit, :update, :destroy]
	
	def index  
		@beds = Bed.where(:hospital_id => current_hospital_super_user.hospital_id)
	end


	def show
	end

	def new
		@bed = Bed.new  
	end 

	def create
		@bed = Bed.new(bed_params)
		@bed.hospital_id = current_hospital_super_user.hospital_id

		if @bed.save
			flash[:success] = "Your bed has been added!"
			# redirect_to @bed
			redirect_to beds_path
		else
			flash.now[:alert] = "Your bed couldn't be added!  Please check the form."
			render 'new'
		end

	end


	def edit
	end

	def update
		if @bed.update(bed_params)
			flash[:success] = "Bed updated."
			redirect_to beds_path
		else
			flash.now[:alert] = "Bed failed to update.  Please check the form."
			render :edit
		end
	end


	def destroy
		@bed.destroy
		flash[:success] = "Bed has been deleted."

		redirect_to beds_path
	end


	private

	def bed_params  
		params.require(:bed).permit(:name)
	end  

	def set_bed
		@bed = bed.find(params[:id])
	end
end
