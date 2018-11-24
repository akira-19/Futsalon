class AddDefaultToPlayer < ActiveRecord::Migration[5.1]
  def change
    remove_column :players, :name, :string
    add_column :players, :name, :string, null: false, default: ""
  end
end
