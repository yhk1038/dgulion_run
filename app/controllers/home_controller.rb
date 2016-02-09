class HomeController < ApplicationController
  def intro
  end

  def index
  end

  def menu1
  end
  
  def main
    @title = "<%= 'DGUlion, 이제 시작합니다' if Today.to_s == '2016-03-17' %>".to_s
    
    
    
  end
end
