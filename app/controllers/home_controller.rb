class HomeController < ApplicationController
  def intro
    redirect_to '/home/main'
  end

  def index
  end

  def menu1
  end
  
  def main
    @title = "<%= 'DGUlion, 이제 시작합니다' if Today.to_s == '2016-03-17' %>".to_s
    
    
    
  end
  
  def question
    
  end
end
