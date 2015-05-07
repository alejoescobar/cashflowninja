class AddColumnToIncomeAndExpense < ActiveRecord::Migration
  def change
    add_column :incomes, :end_date, :date
    add_column :expenses, :end_date, :date
  end
end
