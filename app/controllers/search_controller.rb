class SearchController < ApplicationController
  def result
   # @plans_search_result = Plan.find_by(company_id: 2)
    @plans_search_result = Plan.all
  end
end
