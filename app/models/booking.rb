class Booking < ApplicationRecord
  belongs_to :laptop
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :date_from, :date_to, :status, presence: true
  validate :end_date_after_start_date

  # :date_from cannot be earlier than current date
  # :date_to cannot be earlier than :date_from
  # :status  in_progress declined approved
  validates :status, inclusion: { in: ["In Progress", "Declined", "Approved"], message: "%{value} is not a valid status"}
  # validates :start_date, :end_date, presence: true, availability: true
  
  private

  def end_date_after_start_date
    # return if date_from.blank? || date_to.blank?

    if date_to < date_from
      errors.add(:date_to, "must be after the start date")
    end
  end

end
