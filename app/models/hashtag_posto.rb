class HashtagPosto < ApplicationRecord
  belongs_to :posto
  belongs_to :hashtag
  validates  :posto_id, presence: true
  validates  :hashtag_id, presence: true
end
