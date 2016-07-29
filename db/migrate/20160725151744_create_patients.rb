class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :cnic

      t.timestamps null: false
    end
  end
end
