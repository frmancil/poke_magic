class AddItemTypeToItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :items, :item_type, null: false, foreign_key: true
  end
end
