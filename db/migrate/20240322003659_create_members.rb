class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :full_name
      t.string :username
      t.string :password
      t.string :address
      t.decimal :store_credit_available

      t.timestamps
    end
  end
end
