class Api::V1::RequestDetailsController < Api::V1::BaseController

  def create
    @requestDetail = RequestDetail.new(request_id: create_params[:request_id],
      gender: create_params[:gender],
      age: create_params[:age],
      blood_pressure: create_params[:blood_pressure])

    # @requestDetail = RequestDetail.new(create_params)

    if @requestDetail.save
      
      ActionCable.server.broadcast 'request_detail_channel',
        request_id: @requestDetail.request_id,
        request_detail_id: @requestDetail.id
      head :ok

      # render(
      #   json: @requestDetail.to_json,
      #   status: 201
      #   )
    else 
      render(
        json: @requestDetail.to_json,
        status: 406
        )
    end    
  end



  private

  def create_params
    params.permit(:authentication_token, :request_id, :gender, :age, :blood_pressure)
  end

  def destroy_params
    params.permit(:authentication_token)
  end

end