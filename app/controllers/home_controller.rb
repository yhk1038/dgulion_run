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
    #########################################
    arr_object_id = Array.new
    univ_arr = Array.new
    univ_url_arr = Array.new
    #########################################
    arr_object_id = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]
    univ_arr = ['멋쟁이사자처럼 4기 페이지',
                '강원대','경북대','경희대','건국대','고려대',
                '국민대','단국대','동덕여대','부산대','서강대',
                '서울과기대','서울대','서울시립대','서울여대','성균관대',
                '성신여대','숙명여대','연세대','영남대','원광대',
                '이화여대','전남대','중앙대','충남대','카이스트',
                '평택대','한양대','UNIST']
    univ_url_arr = [
                    'http://brand.likelion.net',                                                                    #멋사 중앙페이지
                    'http://kangwon.likelion.net','http://knu.likelion.net','',                                     ##강원대, ##경북대, ##경희대,
                    'http://konkuk.likelion.net','http://korea.likelion.net/','http://kookmin.likelion.net/',       #건국대, #고려대, #국민대,
                    'http://dankook.likelion.net/','http://dongduk.likelion.net/','http://pnu.likelion.net/',       #단국대, #동덕여대, #부산대,
                    'http://sogang.likelion.net/','http://seoultech.likelion.net','http://snu.likelion.net/',       ##서강대, ##서울과기대, #서울대,
                    'http://uos.likelion.net/','http://swu.likelion.net','http://skku.likelion.net/',               #서울시립대, ##서울여대, ##성균관대,
                    'http://sungshin.likelion.net/','http://sookmyung.likelion.net/','http://yeonsei.likelion.net', ##성신여대, ##숙명여대, #연세대,
                    'http://yu.likelion.net/','http://wku.likelion.net/','http://ehwa.likelion.net',                #영남대, #원광대, ##이화여대,
                    'http://jnu.likelion.net/','http://cau.likelion.net/','http://cnu.likelion.net/',               ##전남대, #중앙대, #충남대,
                    'http://kaist.likelion.net','http://ptu.likelion.net/','http://hyu.likelion.net/',              #카이스트, #평택대, #한양대
                    'http://unist.likelion.net'                                                                     #유니스트
                    ]
    #########################################
    
    
    @univ_arr = univ_arr
    @univ_count = univ_arr.count
    
    @univ_url_arr = univ_url_arr
    
    @arr_object_id = arr_object_id.sample(5)
    
    
  end
  
  def question
    
  end
end
