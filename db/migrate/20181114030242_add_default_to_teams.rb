class AddDefaultToTeams < ActiveRecord::Migration[5.1]
  def change
    change_column :teams, :level, :integer, null: false, default: 4
  end
end
