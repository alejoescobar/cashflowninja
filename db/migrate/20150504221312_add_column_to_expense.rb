class AddColumnToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :recurrence, :integer
  end
end
