class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.boolean :is_public
      t.decimal :center_latitude
      t.decimal :center_longitude
      t.integer :default_zoom

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
