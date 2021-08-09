class Favorite < ApplicationRecord
  belongs_to :User
  belongs_to :favorite_on, polymorphic: true
end
