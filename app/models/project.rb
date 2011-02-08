class Project < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :center_longitude, :numericality => true, :inclusion => { :in => -180..180 }
  validates :center_latitude, :numericality => true, :inclusion => { :in => -90..90}
  validates :default_zoom, :numericality =>{ :greater_than_or_equal_to => 0 }
end
