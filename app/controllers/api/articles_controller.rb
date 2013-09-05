module Api
  class ArticlesController < Api::BaseController
    
    def index
      @articles = Article.all
    end

    def update
      @article = Article.find(params[:id])
      authorize! :update, @article
      @article.update_attributes(params[:article], modifier: current_user)
    end

    def create
      binding.pry
      authorize! :create, Article
      @article = Article.create!(params[:article])
    end

  end
end