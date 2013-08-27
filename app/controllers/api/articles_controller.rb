module Api
  class ArticlesController < Api::BaseController
    
    def index
      @articles = Article.all
    end

  end
end