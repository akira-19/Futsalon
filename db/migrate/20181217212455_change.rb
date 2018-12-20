class Change < ActiveRecord::Migration[5.1]
  def change
    change_column :tournaments, :level, :integer, null: false
    change_column :tournaments, :name, :string, null: false
  end
end
