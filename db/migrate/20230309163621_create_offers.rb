class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.integer :amount
      t.references :user, null: false, foreign_key: true
      t.references :receipts, null: false, foreign_key: true

      t.timestamps
    end
  end
end
