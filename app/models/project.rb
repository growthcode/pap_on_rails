class Project < ActiveRecord::Base
  has_many :pap_actions
  belongs_to :user
  attr_accessible :project_name
end
