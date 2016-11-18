class Hospital < ApplicationRecord
	has_many :hospital_super_users
	has_many :managers
	has_many :beds
	has_many :requests
	validates :logo, presence: true
	validates :name, presence: true
	validates :address, presence: true

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

	has_attached_file :logo, styles: { :medium => "640x" }
	validates_attachment :logo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end
