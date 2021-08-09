class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def like
    @article = Article.find(params[:id])
    Like.create(user_id:current_user.id,article_id:@article.id)
    redirect_to article_path(@article)
  end

  def unlike
    @article = Article.find(params[:id])
    @like = @article.likes.find {|like| like.user_id ==  current_user.id }
    @like.destroy
    redirect_to article_path(@article)
  end

  def fav
    @article = Article.find(params[:id])
    Favorite.create(User_id: current_user.id,favorite_on_id: @article.id, favorite_on_type: @article.class.name)
    redirect_to article_path(@article)
  end

  def unfav
    @article = Article.find(params[:id])
    @favorite = @article.favorites.find {|favorite| favorite.User_id == current_user.id}
    @favorite.destroy
    redirect_to article_path(@article)
  end

end
