class CreateGameResults < ActiveRecord::Migration[5.1]
  def change
    create_table :game_results do |t|
      t.references :team1, foreign_key: { to_table: :teams }, null: false
      t.references :team2, foreign_key: { to_table: :teams }, null: false
      t.integer :score_by_team1, null: false
      t.integer :score_by_team2, null: false
      t.references :tounament, foreign_key: true
      t.datetime :date, null: false
      t.timestamps
    end
  end
end
