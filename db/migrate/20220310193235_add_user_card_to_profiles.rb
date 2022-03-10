class AddUserCardToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :user_card, :string  # addd column, table's name, column's name, data_type
  end
end
