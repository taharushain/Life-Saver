class AddCoordinatesToHospital < ActiveRecord::Migration[5.0]
	def change
		add_column :hospitals, :address, :string
		add_column :hospitals, :latitude, :float
		add_column :hospitals, :longitude, :float
	end
end
