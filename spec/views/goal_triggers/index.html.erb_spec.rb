require 'rails_helper'

RSpec.describe "goal_triggers/index", type: :view do
  before(:each) do
    assign(:goal_triggers, [
      GoalTrigger.create!(
        :frequency => "Frequency",
        :metric => nil,
        :trigger_level => 2,
        :spoils => 3,
        :fee => 4,
        :message => "MyText"
      ),
      GoalTrigger.create!(
        :frequency => "Frequency",
        :metric => nil,
        :trigger_level => 2,
        :spoils => 3,
        :fee => 4,
        :message => "MyText"
      )
    ])
  end

  it "renders a list of goal_triggers" do
    render
    assert_select "tr>td", :text => "Frequency".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
