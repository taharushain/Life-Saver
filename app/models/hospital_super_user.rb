class HospitalSuperUser < ApplicationRecord
	# attr_accessible :user_name, :password, :password_confirmation
	belongs_to :hospital
	attr_accessor :password
	before_save :encrypt_password

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :user_name, :on => :create
	validates_uniqueness_of :user_name


	def self.authenticate(user_name, password)
		hospital_super_user = self.find_by user_name: user_name
		if hospital_super_user && hospital_super_user.password_hash == BCrypt::Engine.hash_secret(password, hospital_super_user.password_salt)
			hospital_super_user
		else
			nil
		end
	end


	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
end
