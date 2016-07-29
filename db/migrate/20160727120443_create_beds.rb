class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds do |t|
      t.string :name
      t.references :hospital, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
