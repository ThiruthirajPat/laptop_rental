class Booking < ApplicationRecord
  belongs_to :laptop
  belongs_to :user
  
  validates :date_from, :date_to, :status, presence: true

  # :date_from cannot be earlier than current date
  # :date_to cannot be earlier than :date_from
  # :status  in_progress declined approved
end
