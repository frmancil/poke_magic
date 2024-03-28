class CreateRarities < ActiveRecord::Migration[7.1]
  def change
    create_table :rarities do |t|
      t.string :name

      t.timestamps
    end
  end
end
