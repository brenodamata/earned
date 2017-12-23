require "rails_helper"

RSpec.describe GoalTriggersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/goal_triggers").to route_to("goal_triggers#index")
    end

    it "routes to #new" do
      expect(:get => "/goal_triggers/new").to route_to("goal_triggers#new")
    end

    it "routes to #show" do
      expect(:get => "/goal_triggers/1").to route_to("goal_triggers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/goal_triggers/1/edit").to route_to("goal_triggers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/goal_triggers").to route_to("goal_triggers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/goal_triggers/1").to route_to("goal_triggers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/goal_triggers/1").to route_to("goal_triggers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/goal_triggers/1").to route_to("goal_triggers#destroy", :id => "1")
    end

  end
end
