# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GameResult, type: :model do
  it_behaves_like 'validate presence', :team1_id
  it_behaves_like 'validate presence', :team2_id
  it_behaves_like 'validate presence', :date


end
