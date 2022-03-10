class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :genre
      t.string :cellphone
      t.string :bank_account
      t.decimal :bank_money
      t.datetime :birth

      t.timestamps
    end
  end
end
