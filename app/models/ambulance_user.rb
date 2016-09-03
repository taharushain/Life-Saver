class AmbulanceUser < ActiveRecord::Base
	# attr_accessible :email, :password, :password_confirmation

	attr_accessor :password
	before_save :encrypt_password

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :name, :on => :create
	validates_presence_of :email
	validates_presence_of :belongs_to
	validates_uniqueness_of :email


	def self.authenticate(email, password)
		ambulance_user = find_by_email(email)
		if ambulance_user && ambulance_user.password_hash == BCrypt::Engine.hash_secret(password, ambulance_user.password_salt)
			ambulance_user
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
