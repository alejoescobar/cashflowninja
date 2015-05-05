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
