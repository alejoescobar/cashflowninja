class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.references :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :projects, :companies
  end
end
