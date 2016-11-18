class AddHospitalToHospitalSuperUsers < ActiveRecord::Migration
  def change
    add_reference :hospital_super_users, :hospital, index: true, foreign_key: true
  end
end
