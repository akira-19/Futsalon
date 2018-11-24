class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :level, null: false

      t.references :plyer, foreign_key: true
      t.timestamps
    end
  end
end
