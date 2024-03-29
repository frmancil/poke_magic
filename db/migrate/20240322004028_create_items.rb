class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.belongs_to :game_edition, index: true, foreign_key: true
      t.belongs_to :game_type, index: true, foreign_key: true
      t.belongs_to :item_type, index: true, foreign_key: true
      t.string :name
      t.integer :stock
      t.decimal :price

      t.timestamps
    end
  end
end
