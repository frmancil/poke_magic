class AddPstToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :PST, :decimal
  end
end
