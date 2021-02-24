class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum: 99 }
  has_many :hashtag_postos, dependent: :destroy
  has_many :postos, through: :hashtag_postos
end
