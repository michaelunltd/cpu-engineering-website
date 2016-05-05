class ArticlesController < ApplicationController
  def index
    @articles = Article.all.sort { |x,y| y.created_at <=> x.created_at }
  end

  def toggle_featured
    @article = Article.find params[:id]

    @article.toggle!
    redirect_to :articles
  end
end
