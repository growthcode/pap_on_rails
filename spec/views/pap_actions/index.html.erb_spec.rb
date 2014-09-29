require 'rails_helper'

RSpec.describe "pap_actions/index", :type => :view do
  before(:each) do
    assign(:pap_actions, [
      PapAction.create!(
        :acting_person_title => "Acting Person Title",
        :acting_person => "Acting Person",
        :action_statement => "Action Statement",
        :description => "MyText",
        :priority => "",
        :position => "",
        :state_of_action => "State Of Action"
      ),
      PapAction.create!(
        :acting_person_title => "Acting Person Title",
        :acting_person => "Acting Person",
        :action_statement => "Action Statement",
        :description => "MyText",
        :priority => "",
        :position => "",
        :state_of_action => "State Of Action"
      )
    ])
  end

  it "renders a list of pap_actions" do
    render
    assert_select "tr>td", :text => "Acting Person Title".to_s, :count => 2
    assert_select "tr>td", :text => "Acting Person".to_s, :count => 2
    assert_select "tr>td", :text => "Action Statement".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "State Of Action".to_s, :count => 2
  end
end
