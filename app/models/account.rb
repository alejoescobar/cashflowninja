# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string
#  amount     :integer
#  active     :boolean
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  belongs_to :company
  has_many :incomes
  has_many :expenses
end
