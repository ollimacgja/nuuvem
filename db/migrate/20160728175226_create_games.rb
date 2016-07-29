class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.string :name
      t.integer :sku
      t.string :boxshot
      t.references :category, index: true
      t.boolean :published

      t.timestamps
    end
    Game.create_translation_table! :description => :text
  end

  def down
    drop_table :games
    Game.drop_translation_table!
  end
end
