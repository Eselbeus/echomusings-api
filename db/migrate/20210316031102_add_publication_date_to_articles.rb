class AddPublicationDateToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :publication_date, :string
  end
end
