class AddLatitudeAndLongitudeToAmbulanceUser < ActiveRecord::Migration[5.0]
  def change
    add_column :ambulance_users, :latitude, :float
    add_column :ambulance_users, :longitude, :float
  end
end
