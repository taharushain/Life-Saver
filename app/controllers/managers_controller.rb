class ManagersController < ApplicationController
  before_filter :authenticate_manager_user, :only => [:index]
  before_filter :authenticate_hospital_super_user, :only => [:new, :create]
  before_filter :save_manager_login_state, :only => [:new, :create]

  def index
    @beds = Bed.where(:hospital_id => current_manager.hospital_id)
  end

  def new
  	@manager = Manager.new
  end

  def create
  	@manager = Manager.new(manager_params)
    @manager.hospital_id = current_hospital_super_user.hospital_id
  	if(@manager.save)
  		redirect_to hospital_super_user_home_path, :notice => "Manager added!"
  	else
  		render 'new'
  	end
  end

  private 

  def manager_params
    params.require(:manager).permit(:user_name,:password_hash, :password_salt, :password, :password_confirmation)
  end
end
