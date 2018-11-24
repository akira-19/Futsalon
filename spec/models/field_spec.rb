# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Field, type: :model do
  describe "nil check for each column" do
    it_behaves_like 'validate presence', :email
    it_behaves_like 'validate presence', :name
    it_behaves_like 'validate presence', :encrypted_password
    it_behaves_like 'validate presence', :prefecture
    it_behaves_like 'validate presence', :city
  end

end
