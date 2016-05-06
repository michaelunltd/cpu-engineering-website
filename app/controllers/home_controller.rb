class HomeController < ApplicationController
  def index
      @articles = Article.where 'featured = ?', true
  end
end
