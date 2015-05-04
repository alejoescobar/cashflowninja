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
    @expense.save
    redirect_to @expense
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :description, :date, :recurrence, :category_id, :project_id)
  end
end
