class CalendarsController < ApplicationController
  before_action :authenticate_user!
  def monthly
    # @income_categories = Category.all.where(transaction_type: 0)
    # @expense_categories = Category.all.where(transaction_type: 1)
    @income_categories = current_user.companies.first.categories.where(transaction_type: 0)
    @expense_categories = current_user.companies.first.categories.where(transaction_type: 1)
    # @incomes = Income.all
    # @expenses = Expense.all
    @incomes = current_user.companies.first.incomes
    @expenses = current_user.companies.first.expenses
    # @projects = Project.all
    # @recurrent_incomes = RecurrentIncome.all
    # @recurrent_expenses = RecurrentExpense.all
    @projects = current_user.companies.first.projects
    @recurrent_incomes = current_user.companies.first.recurrent_incomes
    @recurrent_expenses = current_user.companies.first.recurrent_expenses
    @category_total = 0
    @entry_total = 0
    @project_total = 0
    puts "****************************"
    puts @date = params[:date] ? Date.parse(params[:date]) : Date.today
    puts params[:date]
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    puts "****************************"
    @date_array = view_context.months_header
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Month chart"})
      f.options[:xAxis][:categories] = @date_array.map { |date| date.strftime("%b %Y") }
      f.series(:type=> 'column',:name=> 'Income',:data=> view_context.total_income)
      f.series(:type=> 'column',:name=> 'Expenses',:data=> view_context.total_expense)
      f.series(:type=> 'spline',:name=> 'Cash On Hand', :data=> view_context.cash_on_hand)
    end
  end
end
