class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_admin
  helper_method :is_admin_logged_in
  helper_method :current_hospital_super_user
  helper_method :is_hospital_super_user_logged_in
  helper_method :current_manager
  helper_method :is_manager_logged_in

  private

  def current_hospital_super_user
  	@current_hospital_super_user ||= HospitalSuperUser.find(session[:hospital_super_user_id]) if session[:hospital_super_user_id]
  end

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

   def current_manager
    @current_manager ||= Manager.find(session[:manager_id]) if session[:manager_id]
  end

  def is_admin_logged_in
  	if session[:admin_id]  == nil
  		return false
  	else
  		return true
  	end
  end

  def is_manager_logged_in
    if session[:manager_id]  == nil
      return false
    else
      return true
    end
  end

  def is_hospital_super_user_logged_in
    if session[:hospital_super_user_id]  == nil
      return false
    else
      return true
    end
  end

  protected 


  def authenticate_admin_user
  	if session[:admin_id]
     # set current user object to @current_user object variable
     @current_admin = Admin.find session[:admin_id] 
     return true	
   else
    redirect_to log_in_path
    return false
  end
end

def authenticate_manager_user
    if session[:manager_id]
     # set current user object to @current_user object variable
     @current_manager = Manager.find session[:manager_id] 
     return true  
   else
    redirect_to manager_log_in_path
    return false
  end
end

def authenticate_hospital_super_user
  if session[:hospital_super_user_id]
     # set current user object to @current_user object variable
     @current_hospital_super_user = HospitalSuperUser.find session[:hospital_super_user_id] 
     return true  
   else
    redirect_to hospital_super_user_log_in_path
    return false
  end
end

def save_admin_login_state
	if session[:admin_id]
		redirect_to admin_home_path
		return false
	else
		return true
	end
end

def save_manager_login_state
  if session[:manager_id]
    redirect_to root_path
    return false
  else
    return true
  end
end

def save_hospital_super_user_login_state
  if session[:hospital_super_user_id]
    redirect_to hospital_super_user_home_path
    return false
  else
    return true
  end
end

end
