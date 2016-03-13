class LionController < ApplicationController
    
    def sign_in
        @bgurl = '/home/img/header_lion.png'
    end
    
    def user_seedd
    member =  ['',        ''
                ]
    pwd =     ['2016',    '1523',   '6547',   '1163',   '5831',   '7785',   '9646',   '3342'
                ]
    if LUser.count < member.count
      #초기 비밀번호
      
      i=0
      member.each do |x|
        u = LUser.new
        u.name = x
        u.pwd = pwd[i]
        u.time1 = 0
        u.time2 = 0
        u.save
        i+=1
      end
    end
    redirect_to '/'
    end
    
    def sign_in_
        
        redirect_to '/lion/list'
    end
    
    def list
        @bgurl = '/home/img/header_lion.png'
    end
    
    def mod
        @bgurl = '/home/img/header_lion.png'
    end
    
    def mod_
        
    end
    
end
