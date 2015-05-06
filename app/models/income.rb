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
#

class Income < ActiveRecord::Base
  belongs_to :company
  belongs_to :project
  belongs_to :category
  belongs_to :account
  has_one :recurrent_income
  after_initialize :defaults
  after_create :create_recurrency

  enum recurrence: [:never, :daily, :weekly, :monthly, :yearly]

  def defaults
    self.account_id ||= 1
  end

  def create_recurrency
    puts "I'm here!!!!!!!"
    puts self.recurrence
    puts self.recurrence == "daily"
    case self.recurrence
      when "daily"
        puts "You chose daily"
        RecurrentIncome.create(recurrent_hash: Recurrence.new(every: :day, income: {amount: self.amount}), income_id: self.id)
      when "weekly"
        puts "You chose weekly"
        RecurrentIncome.create(recurrent_hash: Recurrence.new(every: :week, on: self.date.wday,
        starts: self.date, income: {amount: self.amount}), income_id: self.id)
      when "monthly"
        puts "You chose monthly"
        RecurrentIncome.create(recurrent_hash: Recurrence.new(every: :month, on: self.date.day,starts: self.date, until: self.date, income: {amount: self.amount}), income_id: self.id)
      when "yearly"
        puts "You chose yearly"
        RecurrentIncome.create(recurrent_hash: Recurrence.new(every: :year, on: [self.date.month, self.date.day], starts: self.date, income: {amount: self.amount}), income_id: self.id)
      else
        RecurrentIncome.create(recurrent_hash: Recurrence.new(every: :month, on: self.date.day,starts: self.date, until: self.date, income: {amount: self.amount}), income_id: self.id)
    end
  end


end
