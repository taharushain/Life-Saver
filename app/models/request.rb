class Request < ApplicationRecord
	belongs_to :hospital
	validates_presence_of :hospital_id
	validates_presence_of :ambulance_user_id
	# validates :cnic, length: { is: 13 }
end
