class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :cnic, :limit => 8, null: false
      t.timestamps null: false
    end
    add_index :patients, :cnic, unique: true
  end
end
