class ReportsController < ApplicationController
  def index
    @recurrent_incomes = RecurrentIncome.all
    @recurrent_expenses = RecurrentExpense.all
    if params[:start_date]
      @start_date = Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
      @end_date = Date.civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    else
      @start_date = Date.today
      @end_date = Date.today + 1.year
    end
    puts "----------------------------------------"
    # puts start_date
    # puts end_date
    puts "----------------------------------------"
    @date_array = view_context.selected_months(@start_date, @end_date)
    @total_income_array = view_context.report_total_income
    @total_expense_array = view_context.report_total_expense
    @total_cash_array = view_context.cash_on_hand
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Month chart"})
      f.options[:xAxis][:categories] = @date_array.map { |date| date.strftime("%b %Y") }
      f.series(:type=> 'column',:name=> 'Income',:data=> view_context.report_total_income)
      f.series(:type=> 'column',:name=> 'Expenses',:data=> view_context.total_expense)
      f.series(:type=> 'spline',:name=> 'Cash On Hand', :data=> view_context.cash_on_hand)
    end
  end
end
