class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.decimal :lat
      t.decimal :lon
      t.point :latlon, :geographic => true
      t.references :locatable, polymorphic: true
      t.timestamps
    end
  end
end
