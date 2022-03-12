class ChangeColumnsNameToOrdersAndAddOtherColumn < ActiveRecord::Migration[7.0]
  def up
    rename_column :orders, :product, :product_title
  end
  def down
    rename_column :orders, :product_title, :product
  end
end
