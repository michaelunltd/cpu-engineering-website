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
    @title = params[:news][:title]
    @content = params[:news][:content]
    @author = params[:news][:author]
    @real_img_path = params[:news][:img_path].path

    @news = News.new(
      title: @title,
      content: @content,
      img_path: @real_img_path,
      author: @author
    )


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
    @title = params[:news][:title]
    @content = params[:news][:content]
    @author = params[:news][:author]
    @real_img_path = params[:news][:img_path].path

    if @news.update( title: @title, content: @content, img_path: @real_img_path, author: @author)
      redirect_to news_index_path
    else
      render :edit
    end
  end

  def destroy
    @news.destroy

    redirect_to news_index_path
  end

private

  def news_params
    params.require(:news).permit(:title, :content, :img_path, :author)
  end

  def find_news
    @news = News.find params[:id]
  end
end
