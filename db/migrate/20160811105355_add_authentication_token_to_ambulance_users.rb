class AddAuthenticationTokenToAmbulanceUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :ambulance_users, :authentication_token, :string, default: ""
  	add_index :ambulance_users, :authentication_token, unique: true
  end
end
