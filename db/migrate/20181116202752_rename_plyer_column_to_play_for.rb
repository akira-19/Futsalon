class RenamePlyerColumnToPlayFor < ActiveRecord::Migration[5.1]
  def change
    rename_column :play_fors, :plyer_id, :player_id
  end
end
