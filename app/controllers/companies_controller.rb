class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_path @company

    end
  end
  def show
    @company = Company.find params[:id]
    @jobs = @company.jobs
  end
  private
  def company_params
    params.require(:company).permit(:name, :location, :mail, :phone)
  end
end
