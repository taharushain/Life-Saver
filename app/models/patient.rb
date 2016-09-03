class Patient < ApplicationRecord
	validates :cnic, presence: true, length: { is: 13 }

end
