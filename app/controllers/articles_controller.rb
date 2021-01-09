class ArticlesController < ApplicationController
  # before_action :find_article

  def index
    @articles = Article.all.order('id DESC')
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to article_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
