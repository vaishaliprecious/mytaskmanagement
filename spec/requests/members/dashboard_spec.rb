require 'rails_helper'

RSpec.describe "Members::Dashboards", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/members/dashboard/index"
      expect(response).to have_http_status(:success)
    end
  end

end
