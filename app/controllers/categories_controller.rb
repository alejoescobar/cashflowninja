class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.company = current_user.companies.first
    @category.save
    redirect_to @category
  end

  private

  def category_params
    params.require(:category).permit(:name, :company_id)
  end
end
