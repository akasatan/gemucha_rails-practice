class Posto < ApplicationRecord
  has_many :hashtag_postos, dependent: :destroy
  has_many :hashtags, through: :hashtag_postos
  has_many :relationships
  belongs_to :user
  
  after_create do
      posto = Posto.find_by(id: id)
      hashtags  = content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
      hashtags.uniq.map do |hashtag|
        tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
        posto.hashtags << tag
      end
  end
 
  before_update do 
      posto = Posto.find_by(id: id)
      posto.hashtags.clear
      hashtags = content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
      hashtags.uniq.map do |hashtag|
        tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
        posto.hashtags << tag
      end
  end
end
