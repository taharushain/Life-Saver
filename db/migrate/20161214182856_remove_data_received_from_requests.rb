class RemoveDataReceivedFromRequests < ActiveRecord::Migration[5.0]
	def change
		remove_column :requests, :data_received
	end
end
