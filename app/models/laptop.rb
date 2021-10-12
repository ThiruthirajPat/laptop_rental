class Laptop < ApplicationRecord
  belongs_to :user
  
  validates :brand, :model, :operating_system, :date_manufacture, :collection_point, :rental_rate, presence: true

  # brand to select from an array of brands - dropdown
  # model free text
  # operating_system to select from an array of OS
  # date_of_manufacture should be earlier than current date
  # collection_point to select from an array of regions
  # rental_rate numericality cannot be nil /negative

end
