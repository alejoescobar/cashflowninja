class AddIncomeRefToRecurrentIncome < ActiveRecord::Migration
  def change
    add_reference :recurrent_incomes, :income, index: true
    add_foreign_key :recurrent_incomes, :incomes
  end
end
