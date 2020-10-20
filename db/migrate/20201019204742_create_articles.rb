class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :content
      t.string :contentpt2
      t.string :contentpt3
      t.string :imagelink
      t.string :imagelink2
      t.string :imagelink3

      t.timestamps
    end
  end
end
