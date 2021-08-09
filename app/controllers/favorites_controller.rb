class FavoritesController < ApplicationController
  def index
    @favorite = Favorite.where(User_id:current_user.id).pluck(:favorite_on_id)
    @articles = Article.where(id: @favorite)

  end
end
