class AddMemberToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :member, null: false, foreign_key: true
  end
end
