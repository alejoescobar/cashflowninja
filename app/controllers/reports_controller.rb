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

  def categories
    @income_categories = Category.all.where(transaction_type: 0)
    @expense_categories = Category.all.where(transaction_type: 1)
    if params[:start_date]
      @start_date = Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
      @end_date = Date.civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    else
      @start_date = Date.today
      @end_date = Date.today + 1.year
    end
    @date_array = view_context.selected_months(@start_date, @end_date)
    @income_chart = LazyHighCharts::HighChart.new('pie') do |f|
          f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 50, 50, 50]} )
          series = {
                   :type=> 'pie',
                   :name=> 'Categories distribution',
                   :data=> view_context.income_categories_distribution
          }
          f.series(series)
          f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'})
          f.plot_options(:pie=>{
            :allowPointSelect=>true,
            :cursor=>"pointer" ,
            :showInLegend => true,
            :dataLabels=>{
              :enabled=>false,
              :color=>"black",
              :style=>{
                :font=>"13px Helvetica, Verdana, sans-serif"
              }
            }
          })
    end
    @expense_chart = LazyHighCharts::HighChart.new('pie') do |f|
          f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 50, 50, 50]} )
          series = {
                   :type=> 'pie',
                   :name=> 'Categories distribution',
                   :data=> view_context.expense_categories_distribution
          }
          f.series(series)
          f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'})
          f.plot_options(:pie=>{
            :allowPointSelect=>true,
            :cursor=>"pointer" ,
            :showInLegend => true,
            :dataLabels=>{
              :enabled=>false,
              :color=>"black",
              :style=>{
                :font=>"13px Helvetica, Verdana, sans-serif"
              }
            }
          })
    end
  end

end
