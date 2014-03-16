class AddAttachmentPhotoToColocations < ActiveRecord::Migration
  def self.up
    change_table :colocations do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :colocations, :photo
  end
end
