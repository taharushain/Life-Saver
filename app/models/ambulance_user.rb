class AmbulanceUser < ApplicationRecord
	
	# attr_accessible :email, :password, :password_confirmation

	attr_accessor :password
	before_save :encrypt_password
	has_many :requests

	before_create :generate_authentication_token

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :name, :on => :create
	validates_presence_of :email
	validates_presence_of :belongs_to
	validates_uniqueness_of :email
	validates_uniqueness_of :authentication_token

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }


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

	def generate_authentication_token
		loop do
			self.authentication_token = SecureRandom.base64(64)
			break unless AmbulanceUser.find_by(authentication_token: authentication_token)
		end
	end

end
