class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null:false
      t.string :address, null:false
      t.string :city, null:false
      t.string :state, null:false
      t.string :zip, null:false
      t.string :phone, null:false
      t.string :website
      t.string :place_id, null:false
      t.timestamps null: false
    end
  end
end
