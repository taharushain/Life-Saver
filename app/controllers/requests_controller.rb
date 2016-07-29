class RequestsController < ApplicationController
	before_filter :authenticate_manager_user, :only => [:index]
	before_action :set_request, only: [:show, :edit, :update, :destroy]

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

	private

	def request_params  
		params.require(:request).permit(:cnic,:bed_id)
	end  

	def set_request
		@request = Request.find(params[:id])
	end
end
