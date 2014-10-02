class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.point :latlon, :geographic => true
      t.references :locatable, polymorphic: true
      t.timestamps
    end
  end
end
