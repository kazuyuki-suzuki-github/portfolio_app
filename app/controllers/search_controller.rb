class SearchController < ApplicationController
  def result
    
    @search  = Search.new(
      prefecture_id:params[:search][:prefecture_id],
      checkin:params[:search][:checkin],
      checkout:params[:search][:checkout],
      people:params[:search][:people])
      @work_features = Feature.where(genre:1)
      @vacation_features = Feature.where(genre:2)
      @room_type = RoomType.all;

    if !@search.valid?
      render 'home/top'
      return
    end
    
    @prefecture_id = params[:search][:prefecture_id]
    session[:checkin] = params[:search][:checkin]
    session[:checkout] = params[:search][:checkout]
    session[:people] = params[:search][:people]

    search_features = Array.new
    search_features += @sfw = params[:search][:work_features] if !params[:search][:work_features].nil?
    search_features += @sfv = params[:search][:vacation_features] if !params[:search][:vacation_features].nil?

    if !search_features.empty?
      # キーワードが一つでも選択された場合
      target_plan_id =PlanFeature
                              .select('plans_id, count(plans_id)')
                              .where(feature_id: search_features)
                              .group(:plans_id)
                              .order('count(plans_id) desc')
      @search_result = Company.includes(:plans).where(
                                                  companies: {prefecture_id: @prefecture_id},
                                                  plans:
                                                    {id: target_plan_id.map{|i| i.plans_id},
                                                    sale_to: Date.parse(params[:search][:checkout])..Float::INFINITY})
                                                .where.not(plans: {sale_from: Date.parse(params[:search][:checkin])-1..Float::INFINITY})
    else
      # キーワードが選択されていない場合
      @search_result = Company.includes(:plans).where(
                                                  companies: {prefecture_id: @prefecture_id},
                                                  plans:
                                                    {sale_to: Date.parse(params[:search][:checkout])..Float::INFINITY})
                                                .where.not(plans: {sale_from: Date.parse(params[:search][:checkin])-1..Float::INFINITY})
    end
  end
end
