class AddDataReceivedToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :data_received, :boolean, default: false
  end
end
