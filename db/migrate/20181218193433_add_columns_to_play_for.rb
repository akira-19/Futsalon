class AddColumnsToPlayFor < ActiveRecord::Migration[5.1]
  def change
    add_column :play_fors, :register, :boolean, default: false, null: false
    add_column :play_fors, :admin, :boolean, default: false, null: false
  end
end
