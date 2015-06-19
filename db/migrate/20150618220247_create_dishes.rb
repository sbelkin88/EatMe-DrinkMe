class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :title, null: false
      t.string :review, null: false
      t.references :experience, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
