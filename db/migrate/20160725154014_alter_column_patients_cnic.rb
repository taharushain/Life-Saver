class AlterColumnPatientsCnic < ActiveRecord::Migration
  def self.up
    change_table :patients do |t|
      t.change :cnic, :integer
    end
  end
  def self.down
    change_table :patients do |t|
      t.change :cnic, :string
    end
  end
end