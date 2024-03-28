class CreateTrades < ActiveRecord::Migration[7.1]
  def change
    create_table :trades do |t|
      t.string :name
      t.decimal :store_credit
      t.integer :quantity_expected

      t.timestamps
    end
  end
end
