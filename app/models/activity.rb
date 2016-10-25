class Activity < ApplicationRecord
  belongs_to :tagger, class_name: User.name
  belongs_to :user
  belongs_to :activable, polymorphic: true, optional: true

  scope :my_activity, -> user_id{
    where("tag_user_id = ?", user_id)}

  scope :not_seen, -> {where seen: false}
end
