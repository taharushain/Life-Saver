class RequestsController < ApplicationController
	before_filter :authenticate_manager_user, :only => [:index]
	before_action :set_request, only: [:show, :edit, :update, :destroy, :update_details]
	before_action :set_request_detail, only: [:show, :update_details]

	def index  
		@requests = Request.where(:hospital_id => current_manager.hospital_id, :completed => false)
	end

	def history
		@requests = Request.where(:hospital_id => current_manager.hospital_id, :completed => true)
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
		@request_detail = RequestDetail.where(:request_id => @request.id).order("created_at DESC").find(1)
	end
end
