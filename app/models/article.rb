class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, as: :favorite_on, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  def liked?(user)
    !!self.likes.find {|like| like.user_id == user.id }
  end

  def is_favorite?(user)
    !!self.favorites.find {|favorite| favorite.User_id == user.id}
  end

end
