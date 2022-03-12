class AddProductDescriptionToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :product_description, :string
  end
end
