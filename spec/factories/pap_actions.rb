# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pap_action do
    acting_person_title "MyString"
    acting_person "MyString"
    action_statement "MyString"
    description "MyText"
    priority ""
    position ""
    state_of_action "MyString"
  end
end
