class CreateRecurrentExpenses < ActiveRecord::Migration
  def change
    create_table :recurrent_expenses do |t|
      t.string :recurrent_hash
      t.references :expense, index: true

      t.timestamps null: false
    end
    add_foreign_key :recurrent_expenses, :expenses
  end
end
