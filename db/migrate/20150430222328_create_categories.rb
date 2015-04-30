class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.references :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :categories, :companies
  end
end
