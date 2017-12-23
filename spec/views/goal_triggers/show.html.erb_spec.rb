require 'rails_helper'

RSpec.describe "goal_triggers/show", type: :view do
  before(:each) do
    @goal_trigger = assign(:goal_trigger, GoalTrigger.create!(
      :frequency => "Frequency",
      :metric => nil,
      :trigger_level => 2,
      :spoils => 3,
      :fee => 4,
      :message => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Frequency/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/MyText/)
  end
end
