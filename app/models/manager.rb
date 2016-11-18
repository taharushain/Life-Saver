class Manager < ApplicationRecord
	belongs_to :hospital

	attr_accessor :password
	before_save :encrypt_password

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :user_name, :on => :create
	validates_presence_of :hospital_id, :on => :create
	validates_uniqueness_of :user_name


	def self.authenticate(user_name, password)
		manager = self.find_by user_name: user_name
		if manager && manager.password_hash == BCrypt::Engine.hash_secret(password, manager.password_salt)
			manager
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
