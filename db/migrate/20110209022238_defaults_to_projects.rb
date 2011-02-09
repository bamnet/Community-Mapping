class DefaultsToProjects < ActiveRecord::Migration
  def self.up
    change_column :projects, :is_public, :boolean, :default => true
    change_column :projects, :center_latitude, :decimal, :default => 0
    change_column :projects, :center_longitude, :decimal, :default => 0
    change_column :projects, :default_zoom, :integer, :default => 0
  end

  def self.down
  end
end
