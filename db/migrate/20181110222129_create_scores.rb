class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :player, foreign_key: true, null: false
      t.references :team, foreign_key: true, null: false
      t.references :game_result, foreign_key: true, null: false
      t.timestamps
    end
  end
end
