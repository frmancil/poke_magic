class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.belongs_to :member, index: true, foreign_key: true
      t.belongs_to :item, index: true, foreign_key: true
      t.belongs_to :order_status, index: true, foreign_key: true
      t.integer :order_number
      t.boolean :is_completed
      t.decimal :price
      t.integer :quantity
      t.string :payment_link

      t.timestamps
    end
  end
end
