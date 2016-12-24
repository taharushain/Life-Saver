class Api::V1::RequestsController < Api::V1::BaseController

  def create

    @hospitals = nil
    @results = nil

    if params[:radius].present?
      # @hospitals = Hospital.near([params[:latitude], params[:longitude]], params[:radius])
      @hospitals = Hospital.near([params[:latitude].to_f, params[:longitude].to_f], params[:radius].to_i)
      
    else
      @hospitals = Hospital.all
    end

    @reqArray = Array.new

    @hospitals.each do |hospital|
      @request = Request.new(hospital_id: hospital.id,ambulance_user_id: params[:ambulance_user_id], requests_type: params[:requests_type], blood_pressure: params[:blood_pressure], temperature: params[:temperature], breathing: params[:breathing], pulse_rate: params[:pulse_rate]).as_json
      @reqArray.push @request
    end

    ActiveRecord::Base.transaction do
      @results = Request.create(@reqArray)
    end

    @results.each do |result|
      @new_req = Request.new(result.as_json)
      ActionCable.server.broadcast 'request_channel',
      request_id: @new_req.id,
      hospital_id: @new_req.hospital_id,
      ambulance_user_id: @new_req.ambulance_user_id,
      requests_type: @new_req.requests_type,
      blood_pressure: @new_req.blood_pressure,
      temperature: @new_req.temperature,
      breathing: @new_req.breathing,
      pulse_rate: @new_req.pulse_rate,
      remove: false
    end

    render(
      json: @results.as_json,
      status: 201
      )

  rescue ActiveRecord::RecordInvalid => exception
  # do something with exception here
end


def request_status
  @request = Request.where(ambulance_user_id: request_status_params[:ambulance_user_id], accepted: true, completed: false).first
  @hospital = Hospital.find(@request.hospital_id)
  # render(
  #   json: @request.to_json,
  #   status: 201
  #   )

  render( :json => {:request => @request, 
    :hospital => @hospital },
    :status => 201)



end


private

def create_params
  params.permit(:authentication_token, :ambulance_user_id, :requests_type, :blood_pressure, :temperature, :breathing, :pulse_rate, :radius, :latitude, :longitude)
end

def request_status_params
  params.permit(:authentication_token, :ambulance_user_id)
end

def destroy_params
  params.permit(:authentication_token)
end

end