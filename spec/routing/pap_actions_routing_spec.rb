require "rails_helper"

RSpec.describe PapActionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pap_actions").to route_to("pap_actions#index")
    end

    it "routes to #new" do
      expect(:get => "/pap_actions/new").to route_to("pap_actions#new")
    end

    it "routes to #show" do
      expect(:get => "/pap_actions/1").to route_to("pap_actions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pap_actions/1/edit").to route_to("pap_actions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pap_actions").to route_to("pap_actions#create")
    end

    it "routes to #update" do
      expect(:put => "/pap_actions/1").to route_to("pap_actions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pap_actions/1").to route_to("pap_actions#destroy", :id => "1")
    end

  end
end
