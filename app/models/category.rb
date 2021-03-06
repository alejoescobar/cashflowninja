# == Schema Information
#
# Table name: categories
#
#  id               :integer          not null, primary key
#  name             :string
#  company_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  transaction_type :integer
#

class Category < ActiveRecord::Base
  belongs_to :company
  belongs_to :categorizable, polymorphic: true
  has_many :incomes
  has_many :expenses

  enum transaction_type: [:income, :expense]
end
