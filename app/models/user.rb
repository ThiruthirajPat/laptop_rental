class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  has_many :laptops
  has_many :bookings
  #has many :reviews :through =>:bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
end
