class Laptop < ApplicationRecord
  belongs_to :user
  has_one_attached :photo 

  validates :brand, :model, :operating_system, :date_manufacture, :collection_point, :rental_rate, presence: true

  # brand to select from an array of brands - dropdown
  validates :brand, inclusion: { in: %w(HP Apple Dell Asus Acer Lenovo), message: "%{value} is not a valid brand"}
  # model free text
  validates :model, length: { minimum: 5 }  
  # operating_system to select from an array of OS
  validates :operating_system, inclusion: { in: %w(Windows Mac Linux), message: "%{value} is not a valid operating system"}
  # date_manufacture should be earlier than current date
  validate :date_manufacture_cannot_be_in_the_past
  # collection_point to select from an array of regions
  validates :collection_point, inclusion: { in: ["Curepipe, Mauritius", "Port Louis, Mauritius", "Quatre Bornes, Mauritius", "Vacoas, Mauritius", "Rose Hill, Mauritius"], message: "%{value} is not a valid collection point"}
  # rental_rate numericality cannot be nil /negative
  validates :rental_rate, numericality: { only_integer: true }

  def date_manufacture_cannot_be_in_the_past
    if date_manufacture > Date.today
      errors.add(:date_manufacture, "cannot be in the past")
    end
  end

end
