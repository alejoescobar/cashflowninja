class AddNameColumnToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :name, :string
  end
end
