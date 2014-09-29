class Project < ActiveRecord::Base
  has_many :pap_actions
  belongs_to :user
  validates :project_name, :presence => true

  attr_accessible :project_name
end
