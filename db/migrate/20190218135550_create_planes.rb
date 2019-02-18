class CreatePlanes < ActiveRecord::Migration[5.2]
  def change
    create_table :planes do |t|
      t.integer :capacity
      t.string :model
      t.string :registration_number
      t.string :title
      t.text :description
      t.boolean :pilot
      t.integer :autonomy
      t.integer :price
      t.string :airfield
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
