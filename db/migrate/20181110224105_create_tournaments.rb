class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.integer :num_of_team, null: false, default: 0
      t.references :field, foreign_key: true, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :price, null: false
      t.references :tounament_company, foreign_key: true, null: false
      t.timestamps
    end
  end
end
