class CreateHospitalSuperUsers < ActiveRecord::Migration
  def change
    create_table :hospital_super_users do |t|
      t.string :user_name
      t.string :password_hash
      t.string :password_salt

      t.timestamps null: false
    end
  end
end
