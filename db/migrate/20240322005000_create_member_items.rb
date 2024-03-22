class CreateMemberItems < ActiveRecord::Migration[7.1]
  def change
    create_table :member_items do |t|
      t.integer :member_id
      t.integer :item_id
      t.timestamps
    end
  end
end
