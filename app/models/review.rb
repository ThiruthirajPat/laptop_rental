class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, :content, presence: true

  # :rating => inclusion 1 to 5
  # :content => min length 10 characters
end
