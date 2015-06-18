class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :unique_place_id, null: false
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
