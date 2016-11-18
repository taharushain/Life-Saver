class Request < ApplicationRecord
	belongs_to :hospital
	has_one :request_detail
	validates_presence_of :hospital_id
	validates_presence_of :ambulance_user_id
end
