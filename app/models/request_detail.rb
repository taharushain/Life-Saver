class RequestDetail < ApplicationRecord
	belongs_to :request
	validates :cnic, length: { is: 13 }
end
