class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :cnic

      t.timestamps null: false
    end
  end
end
