class AddColumnTotalPriceToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :total_price, :decimal
  end
end
