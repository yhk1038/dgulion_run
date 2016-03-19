class GameController < ApplicationController
    
    def horse
        # 경마말 8마리
        # 각말의 위치를 숫자로 표시 최대 15?
        # 위치 12이상은 배팅 불가.?
        # 힌트들.. 공유?
        
        # @horse[0]은 쓰지않음 / 경마 말의 위치 @horse[round][해당번째말의 위치]
        @horse = []
        @horse[0] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        @horse[1] = [0, 2, 4, 3, 2, 1, 0, 3, 0]
        @horse[2] = [0, 4, 8, 5, 3, 3, 2, 7, 5]
        @horse[3] = [0, 4, 10, 8, 5, 8, 5, 10, 10]
        @horse[4] = [0, 9, 11, 12, 10, 8, 7, 11, 10]
        @horse[5] = [0, 12, 11, 12, 10, 9, 9, 11, 10]
        
        # 게임말의 최대위치?
        @max=12
        # 게임말의 수
        @hn=8
        # round의 수
        @round=5
        
        if params[:id].to_i <= 0
            redirect_to '/game/horse/1'
            return
        end
        
        if params[:id].to_i > @round
            redirect_to '/game/horse/' + @round.to_s
            return
        end
    end
    
end
