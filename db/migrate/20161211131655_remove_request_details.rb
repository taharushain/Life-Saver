class RemoveRequestDetails < ActiveRecord::Migration[5.0]
  def change
  	drop_table :request_details
  end
end
