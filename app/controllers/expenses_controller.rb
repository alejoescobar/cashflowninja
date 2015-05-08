class ExpensesController < ApplicationController
  def index
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new()
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.company = current_user.companies.first
    @expense.account_id = current_user.companies.first.accounts.first.id
    @expense.save
    redirect_to :back
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :description, :date, :end_date, :recurrence, :category_id, :project_id)
  end
end
