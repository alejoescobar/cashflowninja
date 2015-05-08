# == Schema Information
#
# Table name: incomes
#
#  id          :integer          not null, primary key
#  amount      :integer
#  description :text
#  active      :boolean
#  date        :date
#  company_id  :integer
#  project_id  :integer
#  category_id :integer
#  account_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  recurrence  :integer
#  name        :string
#  end_date    :date
#

require 'test_helper'

class IncomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
