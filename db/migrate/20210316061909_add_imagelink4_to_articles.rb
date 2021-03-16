class AddImagelink4ToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :imagelink4, :string
  end
end
