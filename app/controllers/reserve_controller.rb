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
    @reserves = Reserve.where(user_id: current_user.id)
  end
  
  def destroy
    @reserve = Reserve.find_by(id: params[:id]);
    @reserve.destroy
    redirect_to request.referrer || reserve_index_path
  end
end
