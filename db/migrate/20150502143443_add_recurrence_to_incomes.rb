class AddRecurrenceToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :recurrence, :integer
  end
end
