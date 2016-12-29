class AddConditionToRequests < ActiveRecord::Migration[5.0]
  def change
  	add_column :requests, :critical_condition, :boolean, default: false
  end
end
