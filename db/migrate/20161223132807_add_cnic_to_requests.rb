class AddCnicToRequests < ActiveRecord::Migration[5.0]
  def change
  	add_column :requests, :cnic, :integer, :limit => 8
  end
end
