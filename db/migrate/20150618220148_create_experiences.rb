class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name, default: "Untitled Experience"
      t.references :user, null:false, index:true, foreign_key: true

      t.timestamps null: false
    end
  end
end
