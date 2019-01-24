class AddColumnsToPlayFors < ActiveRecord::Migration[5.1]
  def change
    add_column :play_fors, :name, :string
    add_column :play_fors, :position, :string
    add_column :play_fors, :number, :integer
  end
end
