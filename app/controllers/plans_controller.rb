class PlansController < ApplicationController
  
  def new
    @company = Company.find_by(user_id: current_user.id)
    @plan = Plan.new
    @work_features = Feature.where(genre:1)
    @vacation_features = Feature.where(genre:2)
    @room_type = RoomType.all
  end
  
  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      #働くの特徴を登録
      params[:plan][:work_features].each do |v|
        wf = {plans_id: @plan.id, feature_id: v.to_i}
        @pf = PlanFeature.new(wf)
        @pf.save
      end
      #遊ぶの特徴を登録
      params[:plan][:vacation_features].each do |v|
        wf = {plans_id: @plan.id, feature_id: v.to_i}
        @pf = PlanFeature.new(wf)
        @pf.save
      end
      redirect_to companies_path
    else
      @company = Company.find_by(user_id: current_user.id)
      @work_features = Feature.where(genre:1)
      @vacation_features = Feature.where(genre:2)
      @room_type = RoomType.all
      render 'new'
    end
  end
  
  def edit
    @work_features = Feature.where(genre:1)
    @vacation_features = Feature.where(genre:2)
    @plan = Plan.find(params[:id])
    @room_type = RoomType.all
    #働くの特徴を取得
    @plan_work_features = PlanFeature.joins(:feature).where(
                                  plan_features: {plans_id: @plan.id},
                                  features: {genre: 1})
    #遊ぶの特徴を取得
    @plan_vacation_features = PlanFeature.joins(:feature).where(
                                  plan_features: {plans_id: @plan.id},
                                  features: {genre: 2})
  end
  
  def update
    plan_features = PlanFeature.where(plans_id:params[:id])
    @plan = Plan.find(params[:id])

    #画像削除
    if params[:plan][:image_ids]
      params[:plan][:image_ids].each do |image_id|
        image = @plan.portraits.find(image_id)
        image.purge
      end
    end

    if @plan.update(plan_params)
      plan_features.destroy_all
      #働くの特徴を登録
      params[:plan][:work_features].each do |v|
        wf = {plans_id: @plan.id, feature_id: v.to_i}
        @pf = PlanFeature.new(wf)
        @pf.save
      end
      #遊ぶの特徴を登録
      params[:plan][:vacation_features].each do |v|
        wf = {plans_id: @plan.id, feature_id: v.to_i}
        @pf = PlanFeature.new(wf)
        @pf.save
      end
      redirect_to companies_path
    else
      #働くの特徴を取得
      @plan_work_features = PlanFeature.joins(:feature).where(
                                  plan_features: {plans_id: @plan.id},
                                  features: {genre: 1})
      #遊ぶの特徴を取得
      @plan_vacation_features = PlanFeature.joins(:feature).where(
                                  plan_features: {plans_id: @plan.id},
                                  features: {genre: 2})
      @work_features = Feature.where(genre:1)
      @vacation_features = Feature.where(genre:2)
      @room_type = RoomType.all
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
    @room_type = RoomType.all
    render 'show'
  end
  
  private
    def plan_params
      params.require(:plan).permit(:company_id, :name, :check_in, :check_out, :stock, :price, :sale_from, :sale_to, :room_type, portraits: [])
    end
end
