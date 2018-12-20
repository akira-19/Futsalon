class AddColumnToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :default_team_id, :integer
  end
end
