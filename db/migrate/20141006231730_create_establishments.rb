class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.point :latlon, geographic: true
      t.timestamps
    end
  end
end
