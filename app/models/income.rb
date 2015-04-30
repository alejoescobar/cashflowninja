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
#

class Income < ActiveRecord::Base
  belongs_to :company
  belongs_to :project
  belongs_to :category
  belongs_to :account
end
