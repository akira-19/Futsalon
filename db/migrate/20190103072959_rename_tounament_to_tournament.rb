class RenameTounamentToTournament < ActiveRecord::Migration[5.1]
  def change
    rename_column :game_results, :tounament_id, :tournament_id
    rename_column :tournaments, :tounament_company_id, :tournament_company_id
  end
end
