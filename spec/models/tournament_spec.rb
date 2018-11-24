require 'rails_helper'

RSpec.describe Tournament, type: :model do
  it_behaves_like 'validate presence', :field_id
  it_behaves_like 'validate presence', :num_of_team
  it_behaves_like 'validate presence', :start_time
  it_behaves_like 'validate presence', :end_time
  it_behaves_like 'validate presence', :price
  it_behaves_like 'validate presence', :tounament_company_id

end
