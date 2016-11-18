class AddCnicToRequestDetails < ActiveRecord::Migration
  def change
    add_column :request_details, :cnic, :integer, :limit => 8
  end
end
