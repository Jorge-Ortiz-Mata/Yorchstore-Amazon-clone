class ChangeProductDatatypeInOrdersTable < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :product, :string
  end
end
