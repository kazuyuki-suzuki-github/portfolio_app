class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      path = Rails.application.routes.recognize_path(request.referer)
      if path[:controller] == "reserve"
        redirect_to request.referer
      else
        redirect_to root_path
      end
    else
      flash.now[:alert] = "ログインできませんでした"
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
