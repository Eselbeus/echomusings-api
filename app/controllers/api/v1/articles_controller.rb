class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @user = User.find(article_params[:user_id])
    @article = Article.create(article_params)
    @user.articles << @article
    render json: @article
  end

  def update
    @article = Article.find(params[:id])
    @article = Article.update(article_params)
    render json: @article
  end

  private

  def article_params
    params.permit(:user_id, :title, :subtitle, :author, :content, :contentpt2, :contentpt3, :imagelink, :imagelink2, :imagelink3)
  end
end
