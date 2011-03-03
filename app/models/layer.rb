class Layer < ActiveRecord::Base
  belongs_to :project
  has_many :points

  default_scope order(:name)

  validates :name, :presence => true, :uniqueness => true  
  validates_associated :project
  validate :lock_project, :on => :update

  # Toss an error if any tries to update the project_id.
  def lock_project
    errors.add(:project, "can't be updated") if changed_attributes.key?("project_id")
  end
end
