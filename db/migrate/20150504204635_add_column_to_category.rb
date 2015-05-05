class AddColumnToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :transaction_type, :integer
  end
end
