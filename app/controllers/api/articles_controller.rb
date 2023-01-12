class Api::ArticlesController < Api::BaseController
  before_action :set_articles, only: [:index]
  before_action :set_article, only: [:show]

  def index
  end

  def show
  end

  def create
    article = Article.create!(article_params)
    head :created
  rescue ActiveRecord::RecordInvalid => err
    render json: { error: err.message }, status: :unprocessable_entity
  end

  private

  def set_articles
    @articles = Article.all
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:name)
  end
end