class AddRarityToItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :items, :rarity, null: false, foreign_key: true
  end
end
