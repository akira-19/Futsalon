require 'rails_helper'

RSpec.describe Score, type: :model do
  describe "nil check for each column" do
    it_behaves_like 'validate presence', :team_id
    it_behaves_like 'validate presence', :player_id
  end
end
