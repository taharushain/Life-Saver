class CreateRequests < ActiveRecord::Migration
	def change
		create_table :requests do |t|

			t.references :hospital, index: true, foreign_key: true
			t.references :ambulance_user, index: true, foreign_key: true


			t.timestamps null: false
		end
	end
end
