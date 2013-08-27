module Api
  class ArticlesController < Api::BaseController
    
    def index
      @articles = Article.all
    end

    def update
      @article = Article.find(params[:id])
      authorize! :update, @article
      @article.update_attributes(params[:article])
    end

  end
end