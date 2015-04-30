class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
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
    add_foreign_key :expenses, :companies
    add_foreign_key :expenses, :projects
    add_foreign_key :expenses, :categories
    add_foreign_key :expenses, :accounts
  end
end
