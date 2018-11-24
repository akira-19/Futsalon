class BookingTournament < ApplicationRecord
  belongs_to :tounament
  belongs_to :team

  with_options presence: true do
    validates :team_id
    validates :price
    validates :payment
    validates :tournament_id
    validates :price
  end
end
