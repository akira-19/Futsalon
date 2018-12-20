require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe "GET #team_register" do
    it "returns http success" do
      get :team_register
      expect(response).to have_http_status(:success)
    end
  end

end
