class Project < ActiveRecord::Base
  has_many :pap_actions
  belongs_to :user
  validates :project_name, :presence => true

  attr_accessible :project_name


  def number_of_pap_actions
    pap_actions.count
  end
  
  def number_of_state_of_action_complete
    pap_actions.where(state_of_action: "complete").count
  end
  
  def number_of_state_of_action_not_ready
    pap_actions.where(state_of_action: "not ready").count
  end
end
