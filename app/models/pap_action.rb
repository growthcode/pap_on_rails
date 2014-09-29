class PapAction < ActiveRecord::Base
  belongs_to :project
  attr_accessible :acting_person, :acting_person_title, :action_statement, :description, :position, :priority, :state_of_action
end
