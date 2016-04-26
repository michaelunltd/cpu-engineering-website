class NewsController < ApplicationController

  def index
    @news = News.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def news_params
    params.require(:client).permit(:title, :content, :img_path, :author)
  end
end
