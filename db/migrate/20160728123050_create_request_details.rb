class CreateRequestDetails < ActiveRecord::Migration
  def change
    create_table :request_details do |t|

	  t.string :gender
	  t.string :age
	  t.string :blood_pressure
      t.timestamps null: false
    end
  end
end
