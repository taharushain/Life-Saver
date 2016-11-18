class AddVacantToBeds < ActiveRecord::Migration
  def change
    add_column :beds, :vacant, :boolean, default: true
  end
end
