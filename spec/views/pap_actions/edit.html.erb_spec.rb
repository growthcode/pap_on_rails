require 'rails_helper'

RSpec.describe "pap_actions/edit", :type => :view do
  before(:each) do
    @pap_action = assign(:pap_action, PapAction.create!(
      :acting_person_title => "MyString",
      :acting_person => "MyString",
      :action_statement => "MyString",
      :description => "MyText",
      :priority => "",
      :position => "",
      :state_of_action => "MyString"
    ))
  end

  it "renders the edit pap_action form" do
    render

    assert_select "form[action=?][method=?]", pap_action_path(@pap_action), "post" do

      assert_select "input#pap_action_acting_person_title[name=?]", "pap_action[acting_person_title]"

      assert_select "input#pap_action_acting_person[name=?]", "pap_action[acting_person]"

      assert_select "input#pap_action_action_statement[name=?]", "pap_action[action_statement]"

      assert_select "textarea#pap_action_description[name=?]", "pap_action[description]"

      assert_select "input#pap_action_priority[name=?]", "pap_action[priority]"

      assert_select "input#pap_action_position[name=?]", "pap_action[position]"

      assert_select "input#pap_action_state_of_action[name=?]", "pap_action[state_of_action]"
    end
  end
end
