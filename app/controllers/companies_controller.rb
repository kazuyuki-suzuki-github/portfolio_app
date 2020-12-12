class CompaniesController < ApplicationController
  
  def index
    @company = Company.find_by(company_id: current_user.id)
    if !@company.nil?
      @plans = Plan.where(company_id: @company.id)
      @id = @company.id
    end
  end
  
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else
      render 'new'
    end
  end
  
  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to companies_path
    else
      render 'edit'
    end
  end

  private
    def company_params
      params.require(:company).permit(:company_id, :name, :address, :access, :info, :prefecture)
    end
end
