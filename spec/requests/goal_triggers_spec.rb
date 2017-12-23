require 'rails_helper'

RSpec.describe "GoalTriggers", type: :request do
  describe "GET /goal_triggers" do
    it "works! (now write some real specs)" do
      get goal_triggers_path
      expect(response).to have_http_status(200)
    end
  end
end
