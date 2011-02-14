class CreatePoints < ActiveRecord::Migration
  def self.up
    create_table :points do |t|
      t.string :name
      t.text :address
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.datetime :date
      t.references :layer

      t.timestamps
    end
  end

  def self.down
    drop_table :points
  end
end
