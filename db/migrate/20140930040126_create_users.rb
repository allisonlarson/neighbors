class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :display_name
      t.string :name
      t.string :city
      t.string :phone_number
      t.string :image
      t.boolean :send_texts

      t.timestamps
    end
  end
end
