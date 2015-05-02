class CreateRecurrentIncomes < ActiveRecord::Migration
  def change
    create_table :recurrent_incomes do |t|
      t.string :recurrent_hash

      t.timestamps null: false
    end
  end
end
