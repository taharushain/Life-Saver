class AddTypeToRequests < ActiveRecord::Migration[5.0]
  def change
  	add_column :requests, :type, :string
  end
end
