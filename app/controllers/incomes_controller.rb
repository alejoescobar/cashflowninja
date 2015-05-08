class IncomesController < ApplicationController
  def index
  end

  def show
    @income = Income.find(params[:id])
  end

  def new
    @income = Income.new()
  end

  def edit
    @income = Income.find(params[:id])
  end

  def create
    test = params[:category]

    @income = Income.new(income_params)
    @income.company = current_user.companies.first
    @income.account_id = current_user.companies.first.accounts.first.id
    @income.save
    redirect_to :back
  end

  def update
    @income = Income.find(params[:id])
    @income.update(income_params)
    redirect_to :back
  end

  private

  def income_params
    params.require(:income).permit(:name, :amount, :description, :date, :recurrence, :end_date, :category_id, :project_id)
  end
end
