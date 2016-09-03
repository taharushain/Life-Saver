class Bed < ApplicationRecord
  belongs_to :hospital

  validates :name, presence: true
  validates :hospital_id, presence: true
end
