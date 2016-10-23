class Tour < ApplicationRecord
  belongs_to :discount
  belongs_to :place
  belongs_to :category

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :ratings, dependent: :destroy
end
