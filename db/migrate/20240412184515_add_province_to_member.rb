class AddProvinceToMember < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :province, :string
  end
end
