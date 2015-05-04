# == Schema Information
#
# Table name: recurrent_expenses
#
#  id             :integer          not null, primary key
#  recurrent_hash :string
#  expense_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class RecurrentExpense < ActiveRecord::Base
  serialize :recurrent_hash
  belongs_to :expense
end
