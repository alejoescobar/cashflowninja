class CalendarsController < ApplicationController
  def monthly
    @income = Income.all
    @recurrent_income = RecurrentIncome.all
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @total_income = 0
  end
end
