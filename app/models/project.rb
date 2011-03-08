class Project < ActiveRecord::Base
  has_many :layers, :dependent => :destroy
  has_and_belongs_to_many :users

  default_scope order(:name)

  validates :name, :presence => true, :uniqueness => true
  validates :center_longitude, :numericality => true, :inclusion => { :in => -180..180 }
  validates :center_latitude, :numericality => true, :inclusion => { :in => -90..90}
  validates :default_zoom, :numericality =>{ :greater_than_or_equal_to => 0 }
end
