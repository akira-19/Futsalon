require 'rails_helper'

RSpec.describe BookingTournament, type: :model do
  it_behaves_like 'validate presence', :team_id
  it_behaves_like 'validate presence', :price
  it_behaves_like 'validate presence', :payment
  it_behaves_like 'validate presence', :tournament_id
  it_behaves_like 'validate presence', :price

end
