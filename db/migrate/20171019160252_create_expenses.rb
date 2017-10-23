class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :concept
      t.date :date_transaction
      t.decimal :amount
      t.references :category, foreign_key: true
      t.references :transaktion, foreign_key: true

      t.timestamps
    end
  end
end
