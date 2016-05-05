class HomeController < ApplicationController
    def home
        @articles = Article.where 'featured = ?', true
    end
end
