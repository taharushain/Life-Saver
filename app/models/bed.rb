class Bed < ActiveRecord::Base
  belongs_to :hospital

  validates :name, presence: true
  validates :hospital_id, presence: true
end
