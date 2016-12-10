class AddInfoToRequests < ActiveRecord::Migration[5.0]
  def change
  	add_column :requests, :blood_pressure, :string
  	add_column :requests, :temperature, :string
  	add_column :requests, :breathing, :string
  	add_column :requests, :pulse_rate, :string
  end
end
