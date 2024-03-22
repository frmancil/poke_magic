class CreateGameEditions < ActiveRecord::Migration[7.1]
  def change
    create_table :game_editions do |t|
      t.string :name

      t.timestamps
    end
  end
end
