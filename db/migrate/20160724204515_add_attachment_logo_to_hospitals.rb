class AddAttachmentLogoToHospitals < ActiveRecord::Migration
  def self.up
    change_table :hospitals do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :hospitals, :logo
  end
end
