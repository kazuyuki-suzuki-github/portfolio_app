class HomeController < ApplicationController
  def top
    @search  = Search.new
    @work_features = Feature.where(genre:1)
    @vacation_features = Feature.where(genre:2)
  end
  
  def signup
  end
  
  def login
  end

  def about
  end
end
