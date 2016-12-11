class HospitalSuperUsersController < ApplicationController
  
  before_action :authenticate_admin_user, :only => [:new, :create]
  before_action :save_hospital_super_user_login_state, :only => [:new, :create]

  def index
    if current_hospital_super_user == nil
      redirect_to hospital_super_user_log_in_path
    else
    @managers = Manager.where(:hospital_id => current_hospital_super_user.hospital_id)
    end
  end

  def new
  	@hospital_super_user = HospitalSuperUser.new
  end

  def create
  	@hospital_super_user = HospitalSuperUser.new(hospital_super_user_params)
  	if(@hospital_super_user.save)
  		redirect_to admin_home_path, :notice => "Hospital super user added!"
  	else
  		render 'new'
  	end
  end

  private 

  def hospital_super_user_params
    params.require(:hospital_super_user).permit(:user_name,:hospital_id,:password_hash, :password_salt, :password, :password_confirmation)
  end

end
