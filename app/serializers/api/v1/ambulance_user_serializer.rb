class Api::V1::AmbulanceUserSerializer < Api::V1::BaseSerializer
  
  attributes :id, :email, :name, :belongs_to, :created_at, :updated_at

  # has_many :requests, embed: :ids
  # has_many :following

  
end