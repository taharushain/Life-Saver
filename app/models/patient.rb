class Patient < ActiveRecord::Base
	validates :cnic, presence: true, length: { is: 13 }

end
