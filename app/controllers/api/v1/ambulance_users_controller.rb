class Api::V1::AmbulanceUsersController < Api::V1::BaseController


  # respond_to :json

  def show
    # respond_with AmbulanceUser.find(params[:id])

    user = AmbulanceUser.find(params[:id])
    if authenticate_ambulance_user(user)

      render(json: Api::V1::AmbulanceUserSerializer.new(user).to_json)
    else
      render :json => nil, :status => 401
    end
    
  end

  def authenticate_ambulance_user(user)
    ambulance_user = AmbulanceUser.find_by(authentication_token: request.headers['Authorization'])
    if user == ambulance_user
      return true
    else
      return false
    end    
  end

  def get_nearby_hospitals
    if params[:radius].present?
      @hospitals = Hospital.near([params[:latitude], params[:longitude]], params[:radius])
    else
      @hospitals = Hospital.all
    end

    render(
      json: @hospitals.all.to_json,
      status: 201
      )
  end

  def get_nearby_hospitals_params
    params.permit(:authentication_token, :radius, :latitude, :longitude)
  end

 #  def index
 #  	# ambulance_users = AmbulanceUser.all

 #   #  render(
 #   #    json: ActiveModel::ArraySerializer.new(
 #   #      ambulance_users,
 #   #      root: 'ambulance_users',
 #   #    )
 #   #  )  	

 #  i

 #   @ambulance_users = AmbulanceUser.all

 #   render json: @ambulance_users, each_serializer: AmbulanceUserSerializer

 # end


end