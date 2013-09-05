module Api
  class ArticlesController < Api::BaseController
    before_filter :authenticate_user!, only: [:create, :update]

    def index
      @articles = Article.all
    end

    def update
      @article = Article.find(params[:id])
      # authorize! :update, @article
      @article.update_attributes(params[:article].merge(modifier: current_user))
    end

    def create
      # authorize! :create, Article
      @article = Article.create!(params[:article].merge(user: current_user, modifier: current_user))
    end

  end
end