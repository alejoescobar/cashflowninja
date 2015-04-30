class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :amount
      t.boolean :active
      t.references :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :accounts, :companies
  end
end
