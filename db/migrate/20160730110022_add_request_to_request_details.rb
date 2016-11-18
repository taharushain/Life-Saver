class AddRequestToRequestDetails < ActiveRecord::Migration
  def change
    add_reference :request_details, :request, index: true, foreign_key: true
  end
end
