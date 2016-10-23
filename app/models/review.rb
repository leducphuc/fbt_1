class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :activities, as: :activable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100>"}

  validates :title, presence: true, length: {minimum: 6}
  validates :content, presence: true
end
