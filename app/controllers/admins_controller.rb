class AdminsController < ApplicationController

  before_filter :save_admin_login_state, :only => [:new, :create]

  def new
  	@admin = Admin.new
  end

  def create
  	@admin = Admin.new(admin_params)
  	if(@admin.save)
  		redirect_to root_url, :notice => "Signed up!"
  	else
  		render 'new'
  	end
  end

  private 

  def admin_params
    params.require(:admin).permit(:email, :password_hash, :password_salt, :name, :password, :password_confirmation)
  end

end