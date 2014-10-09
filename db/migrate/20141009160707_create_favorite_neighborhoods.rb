class CreateFavoriteNeighborhoods < ActiveRecord::Migration
  def change
    create_table :favorite_neighborhoods do |t|
      t.integer :user_id
      t.integer :neighborhood_id
      t.boolean :primary, :default => false
      
      t.timestamps
    end
  end
end
