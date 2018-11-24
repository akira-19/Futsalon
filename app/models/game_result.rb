class GameResult < ApplicationRecord
  has_many :score
  belongs_to :team1, class_name: 'Team'
  belongs_to :team2, class_name: 'Team'

  with_options presence: true do
    validates :team1_id
    validates :team2_id
    validates :date
  end
end
