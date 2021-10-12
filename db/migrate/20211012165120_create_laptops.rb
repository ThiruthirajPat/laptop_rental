class CreateLaptops < ActiveRecord::Migration[6.0]
  def change
    create_table :laptops do |t|
      t.string :brand
      t.string :model
      t.string :operating_system
      t.datetime :date_manufacture
      t.string :collection_point
      t.integer :rental_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
