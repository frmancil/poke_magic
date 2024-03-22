class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :stock
      t.decimal :price
      t.string :rarity

      t.timestamps
    end
  end
end
