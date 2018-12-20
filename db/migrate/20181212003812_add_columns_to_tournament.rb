class AddColumnsToTournament < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :level, :integer
    add_column :tournaments, :name, :string

  end
end
