class RenameTypeInRequests < ActiveRecord::Migration[5.0]
  def change
  	rename_column :requests, :type, :requests_type
  end
end
