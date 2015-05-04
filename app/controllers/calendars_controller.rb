class CalendarsController < ApplicationController
  def monthly
    @categories = Category.all
    @incomes = Income.all
    @projects = Project.all
    @recurrent_income = RecurrentIncome.all
    @category_total = 0
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
