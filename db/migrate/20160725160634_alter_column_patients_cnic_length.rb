class AlterColumnPatientsCnicLength < ActiveRecord::Migration
  def self.up
    change_table :patients do |t|
      t.change :cnic, :integer, :limit => 8
    end
  end
  def self.down
    change_table :patients do |t|
      t.change :cnic, :string
    end
  end
end
