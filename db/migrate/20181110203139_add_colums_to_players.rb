# frozen_string_literal: true

class AddColumsToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :provider, :string
    add_column :players, :uid, :string
    add_column :players, :username, :string
  end
end
