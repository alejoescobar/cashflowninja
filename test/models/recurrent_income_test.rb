# == Schema Information
#
# Table name: recurrent_incomes
#
#  id             :integer          not null, primary key
#  recurrent_hash :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  income_id      :integer
#

require 'test_helper'

class RecurrentIncomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
