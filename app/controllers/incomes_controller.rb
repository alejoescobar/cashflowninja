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
    test = params[:category]

    @income = Income.new(income_params)
    @income.save
    puts "*************************"
    puts @income.category_id
    puts "*************************"
    redirect_to @income
  end
  private

  def income_params
    params.require(:income).permit(:name, :amount, :description, :date, :recurrence, :end_date, :category_id, :project_id)
  end
end
