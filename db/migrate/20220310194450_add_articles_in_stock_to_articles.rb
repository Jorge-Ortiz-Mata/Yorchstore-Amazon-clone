class AddArticlesInStockToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :stock, :integer
  end
end
