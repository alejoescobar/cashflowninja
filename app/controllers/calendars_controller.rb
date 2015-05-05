class CalendarsController < ApplicationController
  def monthly
    @income_categories = Category.all.where(transaction_type: 0)
    @expense_categories = Category.all.where(transaction_type: 1)
    @incomes = Income.all
    @expenses = Expense.all
    @projects = Project.all
    @recurrent_incomes = RecurrentIncome.all
    @recurrent_expenses = RecurrentExpense.all
    @category_total = 0
    @entry_total = 0
    @project_total = 0
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
