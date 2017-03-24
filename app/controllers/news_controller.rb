class NewsController < ApplicationController
    load_and_authorize_resource
    before_action :find_news, only: [:show, :edit, :destroy, :update]

    def index
        @news = News.all
        @latest = News.order(created_at: :desc).first(5)
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
        @news.remove_image! if params[:news][:remove_image] == '1'

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
        params.require(:news).permit(:title, :caption, :content, :image, :image_cache, :author)
    end

    def find_news
        @news = News.find params[:id]
    end
end
