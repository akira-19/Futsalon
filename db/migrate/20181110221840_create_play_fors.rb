class CreatePlayFors < ActiveRecord::Migration[5.1]
  def change
    create_table :play_fors do |t|
      t.references :plyer, foreign_key: true, null: false
      t.references :team, foreign_key: true, null: false

      t.timestamps
    end
  end
end
