class Api::V1::SessionSerializer < Api::V1::BaseSerializer
  #just some basic attributes
   attributes :id, :email, :name, :belongs_to, :authentication_token

  # def token
  #   object.authentication_token
  # end
end