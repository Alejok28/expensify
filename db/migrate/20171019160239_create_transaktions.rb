class CreateTransaktions < ActiveRecord::Migration[5.0]
  def change
    create_table :transaktions do |t|
      t.string :name

      t.timestamps
    end
  end
end
