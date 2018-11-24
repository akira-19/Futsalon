class PlayFor < ApplicationRecord
  belongs_to :player
  belongs_to :team

  with_options presence: true do
    validates :player_id
    validates :team_id
  end
end
