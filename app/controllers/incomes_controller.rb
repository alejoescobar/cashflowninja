class IncomesController < ApplicationController
  def index
  end

  def show
    @income = Income.find(params[:id])
  end

  def new
    @income = Income.new()
  end

  def create
    @income = Income.new(income_params)
    @income.save
    redirect_to @income
  end
  private

  def income_params
    params.require(:income).permit(:amount, :description, :date, :recurrence)
  end
end
