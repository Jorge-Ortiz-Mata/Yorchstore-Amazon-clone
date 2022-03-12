class AddQuantityAndProductToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :quantity, :integer
    add_column :orders, :product, :integer
  end
end
