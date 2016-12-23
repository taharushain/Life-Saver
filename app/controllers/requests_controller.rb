class RequestsController < ApplicationController
	before_action :authenticate_manager_user
	before_action :set_request, only: [:show, :edit, :update, :destroy, :update_details]

	def index  
		@requests = Request.where(:hospital_id => current_manager.hospital_id, :accepted => false).reverse_order
	end

	
	def accepted
		@requests = Request.where(:hospital_id => current_manager.hospital_id, 
			:accepted => true,
			:completed => false).reverse_order		
	end

	def completed
		@requests = Request.where(:hospital_id => current_manager.hospital_id, :completed => true).reverse_order
	end

	def user_location
		request_id = params[:request_id]
		hospital = Hospital.find(current_manager.hospital_id)
		amb_user = AmbulanceUser.find(Request.find(request_id).ambulance_user_id)
		result = Hash.new
		result[:hospital_latitude] = hospital.latitude
		result[:hospital_longitude] = hospital.longitude
		result[:ambulance_user_latitude] = amb_user.latitude
		result[:ambulance_user_longitude] = amb_user.longitude

		respond_to do |format|
			format.html
			format.json {render json: result }
		end
	end

	def show
	end

	def update_details
		@request.save
	end

	def update
		@request.accepted = true
		ActiveRecord::Base.transaction do
			@request.update(request_params)
			@bed = Bed.find(@request.bed_id)
			@bed.vacant = false
			@bed.save
			Request.where(:ambulance_user_id => @request.ambulance_user_id, :accepted => false).destroy_all
		end
		if !@request.errors.any?
			flash[:success] = "Request Accepted."
			ActionCable.server.broadcast 'request_channel',
			request_id: @request.id,
			hospital_id: @request.hospital_id,
			ambulance_user_id: @request.ambulance_user_id,
			requests_type: @request.requests_type,
			blood_pressure: @request.blood_pressure,
			temperature: @request.temperature,
			breathing: @request.breathing,
			pulse_rate: @request.pulse_rate,
			remove: true

			redirect_to (request_show_path @request)
		else
			flash.now[:alert] = "Request failed to accept.  Please check the form."
			redirect_to (request_show_path @request)
		end	
	end

	private

	def request_params  
		params.require(:request).permit(:cnic,:bed_id)
	end 


	def set_request
		@request = Request.find(params[:id])
	end

	
end
