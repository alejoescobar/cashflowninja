class AddNameColumnToIncome < ActiveRecord::Migration
  def change
    add_column :incomes, :name, :string
  end
end
