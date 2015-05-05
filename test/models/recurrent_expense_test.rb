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

require 'test_helper'

class RecurrentExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
