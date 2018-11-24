require 'rails_helper'

RSpec.describe BookingField, type: :model do
  it_behaves_like 'validate presence', :team_id
  it_behaves_like 'validate presence', :start_time
  it_behaves_like 'validate presence', :end_time
  it_behaves_like 'validate presence', :price
  it_behaves_like 'validate presence', :field_id


end
