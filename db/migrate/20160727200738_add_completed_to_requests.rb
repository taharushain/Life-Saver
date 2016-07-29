class AddCompletedToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :completed, :boolean, default: false
  end
end
