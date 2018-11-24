require 'rails_helper'

RSpec.describe PlayFor, type: :model do
  it_behaves_like 'validate presence', :player_id
  it_behaves_like 'validate presence', :team_id

end
