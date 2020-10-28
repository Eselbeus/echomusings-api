class Api::V1::PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all
    render json: @podcasts
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

  def create
    @user = User.find(article_params[:user_id])
    @podcast = Podcast.create(article_params)
    @user.podcasts << @podcast
    render json: @podcast
  end

  private

  def article_params
    params.permit(:id, :user_id, :title, :subtitle)
  end
end
