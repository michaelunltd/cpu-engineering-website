class HomeController < ApplicationController
    def index
        @articles = Article.where 'featured = ?', true
        @news = News.order(created_at: :desc).first(3)
        @events = Event.all.order(created_at: :desc)
    end
end
