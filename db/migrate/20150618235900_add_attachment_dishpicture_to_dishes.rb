class AddAttachmentDishpictureToDishes < ActiveRecord::Migration
  def self.up
    change_table :dishes do |t|
      t.attachment :dishpicture
    end
  end

  def self.down
    remove_attachment :dishes, :dishpicture
  end
end
