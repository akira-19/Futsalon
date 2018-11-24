class AddColumnToTournamentCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :tournament_companies, :name, :string
  end
end
