class AddContentpt4ToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :contentpt4, :string
  end
end
