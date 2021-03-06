class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.find(params[:article_id])
    @comments = @articles.comments.all
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user_name = current_user.name
    if @comment.save
      redirect_to article_path(@article)
    end
  end



  private
  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end
