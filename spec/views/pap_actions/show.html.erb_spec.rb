require 'rails_helper'

RSpec.describe "pap_actions/show", :type => :view do
  before(:each) do
    @pap_action = assign(:pap_action, PapAction.create!(
      :acting_person_title => "Acting Person Title",
      :acting_person => "Acting Person",
      :action_statement => "Action Statement",
      :description => "MyText",
      :priority => "",
      :position => "",
      :state_of_action => "State Of Action"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Acting Person Title/)
    expect(rendered).to match(/Acting Person/)
    expect(rendered).to match(/Action Statement/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/State Of Action/)
  end
end
