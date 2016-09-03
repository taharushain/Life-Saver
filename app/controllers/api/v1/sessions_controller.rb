class Api::V1::SessionsController < Api::V1::BaseController

  def create
    # ambulance_user = AmbulanceUser.find_by(email: create_params[:email])
    # if ambulance_user && ambulance_user.authenticate(create_params[:password])
    #   self.current_user = ambulance_user
    #   render(
    #     json: Api::V1::SessionSerializer.new(ambulance_user, root: false).to_json,
    #     status: 201
    #     )
    # else
    #   return api_error(status: 401)
    # end
    # ambulance_user = AmbulanceUser.new
    ambulance_user = AmbulanceUser.authenticate(create_params[:email], create_params[:password])
    if !ambulance_user.present? || ambulance_user == nil
      render :json => nil, :status => 404
    else
      ambulance_user.generate_authentication_token!
      render(
        json: Api::V1::SessionSerializer.new(ambulance_user).to_json,
        status: 201
        )
       # render(json: Api::V1::SessionSerializer.new(ambulance_user).to_json)
      # render json: ambulance_user
    end

  end

  def destroy
    ambulance_user = AmbulanceUser.find_by(authentication_token: destroy_params[:authentication_token])
    ambulance_user.generate_authentication_token!
    ambulance_user.save
    head 204
  end

  private
  def create_params
    params.permit(:email, :password)
  end

  def destroy_params
    params.permit(:authentication_token)
  end

end