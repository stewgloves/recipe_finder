class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.integer :cook_time
      t.integer :prep_time
      t.float :ratings
      t.string :category
      t.string :author
      t.string :image
      t.string :cuisine
      t.jsonb :ingredients, default: []


      t.timestamps
    end
  end
end
