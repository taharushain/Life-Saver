class Api::V1::RequestsController < Api::V1::BaseController

  def create
    @request = Request.new(hospital_id: create_params[:hospital_id],ambulance_user_id: create_params[:ambulance_user_id])

    if @request.save
      
      ActionCable.server.broadcast 'request_channel',
        request_id: @request.id,
        hospital_id: @request.hospital_id,
        ambulance_user_id: @request.ambulance_user_id
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
    params.permit(:authentication_token, :hospital_id, :ambulance_user_id)
  end

  def request_status_params
    params.permit(:authentication_token, :request_id)
  end

  def destroy_params
    params.permit(:authentication_token)
  end

end