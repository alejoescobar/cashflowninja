class AddColumnToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :type, :integer
  end
end
