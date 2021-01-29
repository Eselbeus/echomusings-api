class AddEmbedTypeToPodcast < ActiveRecord::Migration[5.2]
  def change
    add_column :podcasts, :embed_type, :string
  end
end
