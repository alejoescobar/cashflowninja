class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @project = Project.new(project_params)
    @project.company = current_user.companies.first
    @project.save
    redirect_to :back
  end

  private

  def project_params
    params.require(:project).permit(:name, :company_id)
  end
end
