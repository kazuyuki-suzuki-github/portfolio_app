class PlansController < ApplicationController
  
  def new
    @company = Company.find_by(company_id: current_user.id)
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to companies_path
    else
      render 'new'
    end
  end
  
  def edit
    @plan = Plan.find(params[:id])
  end
  
  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to companies_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @plan = Plan.find_by(id: params[:id])
    @plan.destroy
    redirect_to request.referrer || companies_path
  end
  
  def show
    @plan = Plan.find_by(id: params[:id])
  end
  
  private
    def plan_params
      params.require(:plan).permit(:company_id, :name, :check_in, :check_out, :stock, :price, :sale_from, :sale_to, :room_type)
    end
end
