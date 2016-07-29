class AddBedToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :bed, index: true, foreign_key: true
  end
end
