class Score < ApplicationRecord
  with_options presence: true do
    validates :player_id
    validates :team_id
  end
end
