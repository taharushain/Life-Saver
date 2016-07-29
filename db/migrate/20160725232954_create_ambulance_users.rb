class CreateAmbulanceUsers < ActiveRecord::Migration
  def change
    create_table :ambulance_users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :name
      t.string :belongs_to

      t.timestamps null: false
    end
  end
end
