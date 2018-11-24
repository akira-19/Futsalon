class AddNameToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :name, :string, null: false, default: "player"
  end
end
