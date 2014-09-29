require 'rails_helper'

RSpec.describe "PapActions", :type => :request do
  describe "GET /pap_actions" do
    it "works! (now write some real specs)" do
      get pap_actions_path
      expect(response).to have_http_status(200)
    end
  end
end
