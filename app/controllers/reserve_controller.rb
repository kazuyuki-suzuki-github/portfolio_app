class ReserveController < ApplicationController
  
  require "date"
  
  def create
    @plan = Plan.find(params[:id])
    @company = Company.find(@plan.company_id)
    reserve = Reserve.new(user_id:current_user.id , company_id:@company.id , plan_id:@plan.id)
    if reserve.save
      #予約日の１週間後から１泊宿泊（暫定対応）
      afterWeek = Date.today + 7
      reserveDetail = ReserveDetail.new(reserve_id:reserve.id, check_in:afterWeek, check_out:afterWeek+1, people:2)
      if reserveDetail.save
        redirect_to root_path
      end
    end
  end
  
  def confirm
    @plan = Plan.find(params[:id])
  end
  
  def index
    @reserves = Reserve.where(user_id: current_user.id)
  end
end
