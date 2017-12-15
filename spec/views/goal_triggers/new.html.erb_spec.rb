require 'rails_helper'

RSpec.describe "goal_triggers/new", type: :view do
  before(:each) do
    assign(:goal_trigger, GoalTrigger.new(
      :frequency => "MyString",
      :metric => nil,
      :trigger_level => 1,
      :spoils => 1,
      :fee => 1,
      :message => "MyText"
    ))
  end

  it "renders new goal_trigger form" do
    render

    assert_select "form[action=?][method=?]", goal_triggers_path, "post" do

      assert_select "input[name=?]", "goal_trigger[frequency]"

      assert_select "input[name=?]", "goal_trigger[metric_id]"

      assert_select "input[name=?]", "goal_trigger[trigger_level]"

      assert_select "input[name=?]", "goal_trigger[spoils]"

      assert_select "input[name=?]", "goal_trigger[fee]"

      assert_select "textarea[name=?]", "goal_trigger[message]"
    end
  end
end
