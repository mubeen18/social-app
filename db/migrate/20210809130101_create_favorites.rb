class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :favorite_on_id
      t.string :favorite_on_type
      t.references :User, null: false, foreign_key: true

      t.timestamps
    end
  end
end
