class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :user_name
      t.string :password_hash
      t.string :password_salt
      t.references :hospital, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
