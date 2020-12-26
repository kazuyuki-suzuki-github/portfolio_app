class ReserveController < ApplicationController
  
  require "date"
  
  def create
    @plan = Plan.find(params[:id])
    @company = Company.find(@plan.company_id)
    reserve = Reserve.new(user_id:current_user.id , company_id:@company.id , plan_id:@plan.id)
    if reserve.save
      reserveDetail = ReserveDetail.new(
        reserve_id:reserve.id, check_in:session[:checkin], check_out:session[:checkout], people:session[:people])
      if reserveDetail.save
        user = User.find(session[:user_id])
        if user.update(coin:(user.coin - 1))
          redirect_to root_path
        end
      end
    end
  end
  
  def confirm
    if logged_in?
      @plan = Plan.find(params[:id])
      @user = User.find(session[:user_id])
    else
      redirect_to login_path
    end
  end
  
  def index
    #@reserves = Reserve.joins(:reserve_details).where(reserves: {user_id: current_user.id})
    @reserves = Reserve.joins(:plan).joins(:company).joins(:reserve_details).where(reserves: {user_id: current_user.id})
    #logger.debug("★★★")
    #@reserves_2.each do |reserve|
    #  logger.debug(reserve.plan.name)
    #  logger.debug(reserve.company.name)
    #end
    #logger.debug("★★★")
  end
  
  def destroy
    @reserve = Reserve.find_by(id: params[:id]);
    @reserve.destroy
    redirect_to request.referrer || reserve_index_path
  end
end
