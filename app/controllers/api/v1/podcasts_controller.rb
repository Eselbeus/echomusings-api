class Api::V1::PodcastsController < ApplicationController
  before_action :load_podcast, only: [:show, :update, :destroy]

  def index
    @podcasts = Podcast.all
    render json: @podcasts
  end

  def show
    render json: @podcast
  end

  def create
    @podcast = Podcast.new(podcast_params)
      if @podcast.save
        render json: @podcast
      else
        render json: @podcast.errors, status: :unprocessable_entity
      end
  end

  def update

    if @podcast.update(podcast_params)
      render json: @podcast
    else
      render json: @podcast.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @podcast.destroy
  end

  private

  def podcast_params
    params.permit(:user_id, :title, :subtitle, :audio, :url, :description, :embed_type)
  end

  def load_podcast
    @podcast = Podcast.find(params[:id])
  end
end
