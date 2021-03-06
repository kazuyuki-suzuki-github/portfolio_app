class CompaniesController < ApplicationController
  
  def index
    if logged_in?
      @company = Company.find_by(user_id: current_user.id)
      if !@company.nil?
        @plans = Plan.where(company_id: @company.id)
        @id = @company.id
      end
    else
      flash.now[:notice] = "ログインしてください"
      render "sessions/new"
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
    
    #画像削除
    if params[:company][:image_id]
      @company.portrait.purge
    end

    if @company.update(company_params)
      redirect_to companies_path
    else
      render 'edit'
    end
  end

  private
    def company_params
      params.require(:company).permit(:user_id, :name, :address, :access, :info, :prefecture_id, :portrait)
    end
end
