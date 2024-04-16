class AddHstToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :HST, :decimal
  end
end
