class Review < ApplicationRecord
  belongs_to :booking
  # :rating => inclusion 1 to 5
  # :content => min length 10 characters

  validates :rating, presence: true, inclusion: { in: 0..5 }
  validates :content, presence: true, length: { minimum: 10 }
end
