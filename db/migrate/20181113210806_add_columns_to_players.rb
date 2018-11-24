class AddColumnsToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :name, :string
    add_column :players, :birthday, :date
    add_column :players, :height, :integer
    add_column :players, :weight, :integer
  end

  add_index :players, :name
end
