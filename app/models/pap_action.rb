class PapAction < ActiveRecord::Base
  belongs_to :project
  validates :action_statement, :priority, :presence => true
  attr_accessible :acting_person, :acting_person_title, :action_statement, :description, :position, :priority, :state_of_action
end
