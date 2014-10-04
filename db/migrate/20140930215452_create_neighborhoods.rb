class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string  :name
      t.string  :description
      t.string  :slug, :unique => true
      t.references :city
      t.timestamps
    end
  end
end
