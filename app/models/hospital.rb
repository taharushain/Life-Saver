class Hospital < ApplicationRecord
	has_many :hospital_super_users
	has_many :managers
	has_many :beds
	validates :logo, presence: true
	validates :name, presence: true

	has_attached_file :logo, styles: { :medium => "640x" }
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
