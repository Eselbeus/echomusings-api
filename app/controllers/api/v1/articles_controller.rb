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
    @user = User.find(article_params[:user_id])
    @article = Article.create(article_params)
    @user.articles << @article
    render json: @article
  end

  def update
    @article = Article.update(article_params)
    render json: @article
  end

  def destroy
    @article.destroy
  end

  private

  def article_params
    params.permit(:id, :user_id, :title, :subtitle, :author, :content, :contentpt2, :contentpt3, :imagelink, :imagelink2, :imagelink3)
  end

  def load_article
    @article = Article.find(params[:id])
  end
end
