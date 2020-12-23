class SearchController < ApplicationController
  def result
    @search  = Search.new(
      prefecture_id:params[:search][:prefecture_id],
      checkin:params[:search][:checkin],
      checkout:params[:search][:checkout],
      people:params[:search][:people])
    if !@search.valid?
      @work_features = Feature.where(genre:1)
      @vacation_features = Feature.where(genre:2)
      render 'home/top'
      return
    end
    
    @prefecture_id = params[:search][:prefecture_id]
    session[:checkin] = params[:search][:checkin]
    session[:checkout] = params[:search][:checkout]
    session[:people] = params[:search][:people]
    @work_features = params[:search][:work_features]
    @vacation_features = params[:search][:vacation_features]
    @work_features.push(@vacation_features)
    @search_features = @work_features.flatten!
    @result_plans_id = Array.new
  
    @result = PlanFeature.select('plans_id, count(plans_id)').where(features_id: @search_features).group(:plans_id).order('count(plans_id) desc')
    @result_plans_id = @result.map{|i| i.plans_id}
    @search_result = Company.includes(:plans).where(plans:{id: @result_plans_id})
  end
end
