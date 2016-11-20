class RequestsController < ApplicationController
	before_action :authenticate_manager_user
	before_action :set_request, only: [:show, :edit, :update, :destroy, :update_details]
	before_action :set_request_detail, only: [:show, :update_details]

	def index  
		@requests = Request.where(:hospital_id => current_manager.hospital_id, :accepted => false).reverse_order
	end

	def received
		@requests = Request.where(:hospital_id => current_manager.hospital_id, 
			:data_received => true,
			:completed => false).reverse_order
	end

	def accepted
		@requests = Request.where(:hospital_id => current_manager.hospital_id, 
			:accepted => true,
			:completed => false, 
			:data_received => false).reverse_order		
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

	def update
		@request.accepted = true
		if @request.update(request_params)
			flash[:success] = "Request Accepted."
			redirect_to (request_show_path @request)
		else
			flash.now[:alert] = "Request failed to accept.  Please check the form."
			redirect_to (request_show_path @request)
		end	
	end

	def update_details
		if @request_detail.update(request_details_params)
			flash[:success] = "Request Accepted."
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

	def request_details_params  
		params.require(:request_detail).permit(:cnic)
	end  

	def set_request
		@request = Request.find(params[:id])
	end

	def set_request_detail
		@request_detail = RequestDetail.where(:request_id => @request.id).order("created_at DESC").first
	end
end
