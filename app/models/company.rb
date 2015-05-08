# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  belongs_to :user
  has_many :accounts
  has_many :categories
  has_many :incomes
  has_many :expenses
  has_many :projects
  has_many :project_expenses, through: :projects, source: :expenses
  has_many :project_incomes, through: :projects, source: :incomes
  has_many :recurrent_incomes, through: :incomes
  has_many :recurrent_expenses, through: :expenses

end
