class RemoveProvinceFromMembers < ActiveRecord::Migration[7.1]
  def change
    remove_column :members, :province, :string
  end
end
