class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.boolean :is_completed
      t.decimal :price
      t.integer :quantity
      t.string :payment_link

      t.timestamps
    end
  end
end
