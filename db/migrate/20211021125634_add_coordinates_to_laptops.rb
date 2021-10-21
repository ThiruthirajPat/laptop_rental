class AddCoordinatesToLaptops < ActiveRecord::Migration[6.0]
  def change
    add_column :laptops, :latitude, :float
    add_column :laptops, :longitude, :float
  end
end
