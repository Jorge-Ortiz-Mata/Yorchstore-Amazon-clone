class ChangeDatatypeForBirth < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :birth, :date
  end
end
