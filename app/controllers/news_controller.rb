class NewsController < ApplicationController
  before_action :find_news, only: [:show, :edit, :destroy, :update]

  def index
    @news = News.all
  end

  def show
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to news_index_path
    else
      flash[:notice] = 'News WAS NOT added.'
      render :new
    end
  end

  def edit
  end

  def update
    if params[:news][:remove_image] == '1'
      @news.remove_image!
    end

    if @news.update(news_params)
      redirect_to news_index_path
    else
      flash[:notice] = 'News WAS NOT updated.'
      render :edit
    end
  end

  def destroy
    @news.destroy

    redirect_to news_index_path
  end

private

  def news_params
    params.require(:news).permit(:title, :content, :image, :author)
  end

  def find_news
    @news = News.find params[:id]
  end
end
