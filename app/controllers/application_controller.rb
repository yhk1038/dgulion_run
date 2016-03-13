class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  #한 타임별 면접자 수
  $time_num = 2
  
  
  helper_method :current_luser
  def current_luser
    if session[:luser_id]
      u = LUser.where(id: session[:luser_id]).first
      if u.nil?
        session[:luser_id]=
        nil
      else
        u
      end
    else
      nil
    end
  end
end
