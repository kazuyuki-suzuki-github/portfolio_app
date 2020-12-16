class SearchController < ApplicationController
  def result

    @search  = Search.new(
      prefecture_id:params[:search][:prefecture_id],
      checkin:params[:search][:checkin],
      checkout:params[:search][:checkout])
    if !@search.valid?
      @work_features = Feature.where(genre:1)
      @vacation_features = Feature.where(genre:2)
      render 'home/top'
      return
    end
    
    @prefecture_id = params[:search][:prefecture_id]
    @checkin = params[:search][:checkin]
    @checkout = params[:search][:checkout]
    @work_features = params[:search][:work_features]
    @vacation_features = params[:search][:vacation_features]
    @work_features.push(@vacation_features)
    @search_features = @work_features.flatten!
    @result_plans_id = Array.new
  
    @result = PlanFeature.select('plans_id, count(plans_id)').where(features_id: @search_features).group(:plans_id).order('count(plans_id) desc')
    #@result.each do |res|
    #  @result_plans_id.push(res.plans_id)
    #end
    @result_plans_id = @result.map{|i| i.plans_id}
    logger.debug("#{@result_plans_id}")

    sql =  
      "select
        p.*
      from
        companies c
          inner join plans p on
          p.company_id = c.id
      where
        c.prefecture_id = ?
        and p.sale_from <= ?
        and p.sale_to >= ?
        and p.id IN (?)
      "
    @plans_search_result = Plan.find_by_sql([sql,@prefecture_id, @checkin, @checkout,@result_plans_id])
  end
end
