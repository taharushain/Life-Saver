module Authenticable

  def current_ambulance_user
  	@current_ambulance_user ||= AmbulanceUser.find_by(authentication_token: request.headers['Authorization'])
  end
end