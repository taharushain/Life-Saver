class Api::V1::RequestsController < Api::V1::BaseController

  def create
    @request = Request.new(hospital_id: create_params[:hospital_id],ambulance_user_id: create_params[:ambulance_user_id], requests_type: create_params[:requests_type], blood_pressure: create_params[:blood_pressure], temperature: create_params[:temperature], breathing: create_params[:breathing], pulse_rate: create_params[:pulse_rate])

    if @request.save
      
      ActionCable.server.broadcast 'request_channel',
        request_id: @request.id,
        hospital_id: @request.hospital_id,
        ambulance_user_id: @request.ambulance_user_id,
        requests_type: @request.requests_type,
        blood_pressure: @request.blood_pressure,
        temperature: @request.temperature,
        breathing: @request.breathing,
        pulse_rate: @request.pulse_rate

      render(
        json: @request.to_json,
        status: 201
        )
    else 
      render(
        json: @request.to_json,
        status: 401
        )
    end    
  end

  def request_status
    @request = Request.find(request_status_params[:request_id])
    if @request_id == nil
        render(
          json: @request.to_json,
          status: 201
          )
    else
        render(
          json: @request.to_json,
          status: 201
          )
    end

  end


  private

  def create_params
    params.permit(:authentication_token, :hospital_id, :ambulance_user_id, :requests_type, :blood_pressure, :temperature, :breathing, :pulse_rate)
  end

  def request_status_params
    params.permit(:authentication_token, :request_id)
  end

  def destroy_params
    params.permit(:authentication_token)
  end

end