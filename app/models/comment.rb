class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  belongs_to :tour
  belongs_to :commentable, polymorphic: true

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :activities, as: :activable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :body, presence: true
end
