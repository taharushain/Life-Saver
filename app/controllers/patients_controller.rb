class PatientsController < ApplicationController

	before_filter :authenticate_admin_user, :only => [:index, :show, :new, :create, :edit, :update]
	before_action :set_patient, only: [:show, :edit, :update, :destroy]

	def index  
		@patients = Patient.all
	end

	def show
	end

	def new
		@patient = Patient.new
	end

	def create
		@patient = Patient.new(patient_params)

		if @patient.save
			flash[:success] = "Patient has been added!"
			redirect_to @patient
		else
			flash.now[:alert] = "Patient couldn't be added!  Please check the form."
			render 'new'
		end

	end

	def edit
	end

	def update
		if @patient.update(patient_params)
			flash[:success] = "Patient updated."
			redirect_to patients_path
		else
			flash.now[:alert] = "Patient failed to update.  Please check the form."
			render :edit
		end
	end


	private

	def patient_params  
		params.require(:patient).permit(:cnic)
	end  

	def set_patient
		@patient = Patient.find(params[:id])
	end

end
