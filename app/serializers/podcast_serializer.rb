class PodcastSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :user_id, :title, :subtitle, :audioUrl, :url, :description

  def audioUrl
    rails_blob_path(object.audio, only_path: true) if object.audio.attached?
  end
end
