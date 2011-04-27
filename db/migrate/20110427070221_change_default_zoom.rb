class ChangeDefaultZoom < ActiveRecord::Migration
  def self.up
    change_column_default :projects, :default_zoom, 1
  end

  def self.down
    change_column_default :projects, :default_zoom, 0
  end
end
