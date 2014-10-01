class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.integer :lat
      t.integer :lng
      t.references :locatable, polymorphic: true
      t.timestamps
    end
  end
end
