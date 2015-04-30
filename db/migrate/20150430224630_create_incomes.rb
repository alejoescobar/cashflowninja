class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.integer :amount
      t.text :description
      t.boolean :active
      t.date :date
      t.references :company, index: true
      t.references :project, index: true
      t.references :category, index: true
      t.references :account, index: true

      t.timestamps null: false
    end
    add_foreign_key :incomes, :companies
    add_foreign_key :incomes, :projects
    add_foreign_key :incomes, :categories
    add_foreign_key :incomes, :accounts
  end
end
