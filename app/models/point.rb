class Point < ActiveRecord::Base
  belongs_to :layer

  validates :name, :presence => true, :uniqueness => true
  validates :longitude, :numericality => true, :inclusion => { :in => -180..180 }
  validates :latitude, :numericality => true, :inclusion => { :in => -90..90}
  validates_associated :layer  

  validate :lock_project, :on => :update

  # Toss an error if any tries to update the project_id.
  def lock_project
    if changed_attributes.key?("layer_id")
     old_layer = Layer.find(layer_id_was)
     errors.add(:layer, "can't be from another project") if old_layer.project_id != layer.project_id
    end
  end

end
