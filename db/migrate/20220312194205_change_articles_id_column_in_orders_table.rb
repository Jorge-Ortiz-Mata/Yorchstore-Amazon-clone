class ChangeArticlesIdColumnInOrdersTable < ActiveRecord::Migration[7.0]
  def up
    rename_column :orders, :articles_id, :article_id
  end
  def down
    rename_column :orders, :article_id, :articles_id
  end
end
