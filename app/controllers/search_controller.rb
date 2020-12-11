class SearchController < ApplicationController
  def result
    @prefecture_id = params[:prefecture_id]
    @checkin = params[:checkin]
    @checkout = params[:checkout]
    sql =  
      "select
        p.*
      from
        companies c
          inner join plans p on
          p.company_id = c.id
      where
        c.prefecture = ?
        and p.sale_from <= ?
        and p.sale_to >= ?
      "
    @plans_search_result = Plan.find_by_sql([sql,@prefecture_id, @checkin, @checkout])
  end
end
