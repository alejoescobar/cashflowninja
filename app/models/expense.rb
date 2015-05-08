# == Schema Information
#
# Table name: expenses
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
#  name        :string
#  recurrence  :integer
#  end_date    :date
#

class Expense < ActiveRecord::Base
  belongs_to :company
  belongs_to :project
  belongs_to :category
  belongs_to :account
  has_one :recurrent_expense

  after_create :create_recurrency

  enum recurrence: [:never, :daily, :weekly, :monthly, :yearly]

  def create_recurrency
    puts "I'm here!!!!!!!"
    puts self.recurrence
    puts self.recurrence == "daily"
    case self.recurrence
      when "daily"
        puts "You chose daily"
        if self.date == self.end_date
          RecurrentExpense.create(recurrent_hash: Recurrence.new(every: :day, expense: {amount: self.amount}), expense_id: self.id)
        else
          RecurrentExpense.create(recurrent_hash: Recurrence.new(every: :day, starts: self.date, until: self.end_date, income: {amount: self.amount}), expense_id: self.id)
        end
      when "weekly"
        puts "You chose weekly"
        if self.date == self.end_date
          RecurrentExpense.create(recurrent_hash: Recurrence.new(every: :week, on: self.date.wday,
          starts: self.date, expense: {amount: self.amount}), expense_id: self.id)
        else
          RecurrentExpense.create(recurrent_hash: Recurrence.new(every: :week, on: self.date.wday,
          starts: self.date, until: self.end_date, expense: {amount: self.amount}), expense_id: self.id)
        end
      when "monthly"
        puts "You chose monthly"
        if self.date == self.end_date
          RecurrentExpense.create(recurrent_hash: Recurrence.new(every: :month, on: self.date.day,starts: self.date, expense: {amount: self.amount}), expense_id: self.id)
        else
          RecurrentExpense.create(recurrent_hash: Recurrence.new(every: :month, on: self.date.day,starts: self.date, until: self.end_date, expense: {amount: self.amount}), expense_id: self.id)
        end
      when "yearly"
        puts "You chose yearly"
        if self.date == self.end_date
          RecurrentExpense.create(recurrent_hash: Recurrence.new(every: :year, on: [self.date.month, self.date.day], starts: self.date, expense: {amount: self.amount}), expense_id: self.id)
        else
          RecurrentExpense.create(recurrent_hash: Recurrence.new(every: :year, on: [self.date.month, self.date.day], starts: self.date, until: self.end_date, expense: {amount: self.amount}), expense_id: self.id)
        end
      else
        RecurrentExpense.create(recurrent_hash: Recurrence.new(every: :month, on: self.date.day,starts: self.date, until: self.date, income: {amount: self.amount}), expense_id: self.id)
    end
  end
end
