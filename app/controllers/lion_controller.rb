class LionController < ApplicationController
    before_action :is_lsign_in?, except: [:sign_in, :sign_in_, :lion_admin, :no_time, :no_time2, :user_seedd, :time_seedd, :time_num]
    before_action :bgl
    
    def bgl
        @bgurl = '/home/img/header_lion.png'
    end
    
    def is_lsign_in?
        u = LUser.new
        if session[:luser_id]
          u = LUser.where(id: session[:luser_id]).first
          if u.nil?
            flash[:error] = "잘못된 사용자 입니다."
            reset_session
            redirect_to '/home/error'
          end
          true
        else
          flash[:error] = "로그인이 필요한 서비스 입니다."
          redirect_to '/home/error'
        end
    end
    
    def mod_pwd_
        if params[:password] == nil || params[:password] == ''
            flash[:error] = "비밀번호를 입력해주세요!"
            redirect_to :back
            return
        end
        if params[:password] != params[:password2]
            flash[:error] = "비밀번호를 확인해주세요!"
            redirect_to :back
            return
        end
        
        u = current_luser
        u.password = params[:password]
        u.save
        redirect_to '/lion/list'
    end
    
    def sign_out
        reset_session
        redirect_to '/lion/sign_out'
    end
    
    def no_time
        #lion = id
        #해당시간 등록을 더이상 못하게 막음
        a = Notime.new
        a.ltime_id = params[:lion].to_id
        a.save
    end
    
    def no_time2
        #lion = id
        #해당시간 막고, 설정해놓은 사람까지 다 해제
        a = Notime.new
        a.ltime_id = params[:lion].to_id
        a.save
        id = params[:lion].to_i
        LUser.all.each do |x|
            x.time1 = 0 if x.time1 == id
            x.time2 = 0 if x.time2 == id
            x.time3 = 0 if x.time3 == id
            x.save
        end
    end
    
    def sign_in
        @bgurl = '/home/img/header_lion.png'
        if current_luser
            redirect_to '/lion/list'
            return
        else
            reset_session
        end
    end
    
    def user_seedd
    member =  ['정재호',	'김재민',	'소병현',	'임규산',	'정광근',	'박성준',	'유선우',	'임성훈',	'김가경',	'김은식',	'황고운',	'이소희',	'김보미',	'이현경',	'신새날',	'한주혜',	'조지연',	'추정호',	'송다혜',	'송은지',	'왕대현',	'이나라',	'김지원',	'어현선',	'백기목',	'추연훈',	'강상민',	'김성배',	'홍석현',	'김남균',	'김자영',	'노종원',	'이지훈',	'조이슬',	'최승훈',	'서유진',	'조유림',	'정순우',	'조현욱',	'김치현',	'이가을',	'이은영',	'장준희',	'고준희',	'김귀현',	'조다빈',	'김창기',	'박승현',	'백종수',	'권윤환'
                ]
    pwd =     ['1023',	'1068',	'1206',	'1229',	'1235',	'1238',	'1239',	'1260',	'1268',	'1490',	'2089',	'2109',	'2308',	'2398',	'2498',	'2657',	'2983',	'3208',	'3824',	'3845',	'3945',	'4048',	'4489',	'4548',	'4579',	'4597',	'4897',	'5012',	'5120',	'5670',	'5789',	'6278',	'6510',	'6542',	'6580',	'6875',	'7809',	'7831',	'7895',	'7899',	'7970',	'8078',	'8431',	'8791',	'8973',	'9045',	'9823',	'9872',	'9875',	'9883'
                ]
    if LUser.count < member.count
      #초기 비밀번호
      
        member.each do |x|
            u = LUser.new
            u.name = x
            u.password = pwd[i]
            u.time1 = 0
            u.time2 = 0
            u.time3 = 0
            u.save
        end
    end
    redirect_to '/lion/sign_in'
    end
    
    def time_num
        $time_num = params[:time_num].to_i
        redirect_to '/'
        
    end
    
    def time_seedd
    name =  ['1: 월 12:30~12:50',	'2: 월 13:00~13:20',	'3: 월 13:30~13:50',	'4: 월 13:50~14:10',	'5: 월 14:10~14:30',	'6: 월 14:30~14:50',	'7: 월 15:00~15:20',	'8: 월 15:20~15:40',	'9: 월 16:00~16:20',	'10: 월 16:20~16:40',	'11: 월 16:50~17:10',	'12: 월 17:10~17:30',	'13: 월 18:30~18:50',	'14: 월 18:50~19:10',	'15: 월 19:10~19:30',	'16: 월 19:30~19:50',	'17: 화 12:00~12:20',	'18: 화 12:20~12:40',	'19: 화 12:40~13:00',	'20: 화 13:00~13:20',	'21: 화 13:30~13:50',	'22: 화 14:00~14:20',	'23: 화 14:20~14:40',	'24: 화 14:40~15:00',	'25: 화 15:10~15:30',	'26: 화 15:40~16:00',	'27: 화 16:00~16:20',	'28: 화 16:30~16:50',	'29: 화 17:00~17:20',	'30: 화 17:30~17:50'
                ]
    if LTime.count < name.count
      
    i=0
    name.each do |x|
        u = LTime.new
        u.name = x
        u.time1 = 0
        u.time2 = 0
        u.time3 = 0
        u.time4 = 0
        u.save
        i+=1
        end
    end
    redirect_to '/lion/sign_in'
    end
    
    def sign_in_
        u = LUser.where(name: params[:name], password: params[:password]).first
        if u.nil?
            flash[:error] = '이름이나 비밀번호가 잘못되었습니다 !'
            redirect_to :back
            return
        end
        
        session[:luser_id] = u.id
        
        redirect_to '/lion/list'
    end
    
    def list
        @bgurl = '/home/img/header_lion.png'
    end
    
    def mod
        @bgurl = '/home/img/header_lion.png'
    end
    
    def mod_
        u = current_luser
        #예외 처리 1
        Notime.all.each do |x|
            if x.ltime_id == params[:time1].to_i
                flash[:error] = '[1지망] 해당 시간을 선택할 수 없습니다 !'
                redirect_to :back
                return
            end
            if x.ltime_id == params[:time2].to_i
                flash[:error] = '[2지망] 해당 시간을 선택할 수 없습니다 !'
                redirect_to :back
                return
            end
        end
        
        #예외 처리 2
        if params[:time1].to_i != 0
            t = LTime.where(id: params[:time1].to_i).first
            
            if t.nil? && params[:time1].to_i != 0
                flash[:error] = '시간 정보가 잘못되었습니다 !'
                redirect_to :back
                return
            end
            if t.time1 != 0 && t.time2 != 0 && $time_num < 3
                flash[:error] = '[1지망] 해당 시간의 면접자 인원이 꽉 찼습니다 !'
                redirect_to :back
                return
            elsif t.time1 != 0 && t.time2 != 0 && t.time3 != 0 && $time_num < 4
                flash[:error] = '[1지망] 해당 시간의 면접자 인원이 꽉 찼습니다 !'
                redirect_to :back
                return
            elsif t.time1 != 0 && t.time2 != 0 && t.time3 != 0 && t.time4 != 0 && $time_num < 5
                flash[:error] = '[1지망] 해당 시간의 면접자 인원이 꽉 찼습니다 !'
                redirect_to :back
                return
            end
        end
        
        #기존의 데이터 삭제
        if current_luser.time1 != 0
            t2 = LTime.find(current_luser.time1)
            if t2.time1 == current_luser.id
                t2.time1 = t2.time2
                t2.time2 = t2.time3
                t2.time3 = t2.time4
                t2.time4 = 0
            elsif t2.time2 == current_luser.id
                t2.time2 = t2.time3
                t2.time3 = t2.time4
                t2.time4 = 0
            elsif t2.time3 == current_luser.id
                t2.time3 = t2.time4
                t2.time4 = 0
            else
                t2.time4 = 0
            end
            t2.save
        end
        if params[:time1].to_i != 0
            if t.time1 == 0 
                t.time1 = session[:luser_id] 
            else
                if t.time2 == 0
                    t.time2 = session[:luser_id] 
                else
                    if t.time3 == 0
                        t.time3 = session[:luser_id]
                    else
                        t.time4 = session[:luser_id]
                    end
                end
            end
            t.save
        end
        
        
        u.time1 = params[:time1].to_i
        u.time2 = params[:time2].to_i
        u.save
        
        redirect_to '/lion/list'
    end
    
end
