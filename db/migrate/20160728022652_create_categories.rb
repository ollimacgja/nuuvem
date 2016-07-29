class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.timestamps
    end
    Category.create_translation_table! :name => :string
  end

  def down
    drop_table :categories
    Category.drop_translation_table!
  end
end
