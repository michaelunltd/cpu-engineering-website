class HomeController < ApplicationController
    def index
        @articles = Article.where 'featured = ?', true
        @news = News.order(created_at: :desc).first(3)
    end
end
