class AddGstToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :GST, :decimal
  end
end
