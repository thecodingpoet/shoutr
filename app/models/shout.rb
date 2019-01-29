class Shout < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: {minimum:1, maximum:144}
  validates :user, presence: true

  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
