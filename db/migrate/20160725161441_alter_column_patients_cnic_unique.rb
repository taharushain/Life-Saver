class AlterColumnPatientsCnicUnique < ActiveRecord::Migration
  def self.up
    change_table :patients do |t|
      t.change :cnic, :integer, :limit => 8, null: false
    end
    add_index :patients, :cnic, unique: true
  end
  def self.down
    change_table :patients do |t|
      t.change :cnic, :integer, :limit => 8
    end
  end
end
