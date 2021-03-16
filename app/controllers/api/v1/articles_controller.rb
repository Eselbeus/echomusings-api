class Api::V1::ArticlesController < ApplicationController
  before_action :load_article, only: [:show, :update, :destroy]

  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
  end

  private

  def article_params
    params.permit(:user_id, :title, :subtitle, :author, :publication_date, :content, :contentpt2, :contentpt3, :imagelink, :imagelink2, :imagelink3)
  end

  def load_article
    @article = Article.find(params[:id])
  end
end
