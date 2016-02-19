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
    univ_arr = Array.new
    univ_arr = ['멋쟁이사자처럼 4기 페이지',
                '강원대','경북대','경희대','건국대','고려대',
                '국민대','단국대','동덕여대','부산대','서강대',
                '서울과기대','서울대','서울시립대','서울여대','성균관대',
                '성신여대','숙명여대','연세대','영남대','원광대',
                '이화여대','전남대','중앙대','충남대','카이스트',
                '평택대','한양대','UNIST']
    @univ_arr = univ_arr
    @univ_count = univ_arr.count
    
    @univ_random = univ_arr.sample(5)
    
  end
  
  def question
    
  end
end
