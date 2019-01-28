class Shout < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: {minimum:1, maximum:144}
  validates :user, presence: true
end
