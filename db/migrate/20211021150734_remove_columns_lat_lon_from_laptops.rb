class RemoveColumnsLatLonFromLaptops < ActiveRecord::Migration[6.0]
  def change
    remove_column :laptops, :latitude, :float
    remove_column :laptops, :longitude, :float
  end
end
