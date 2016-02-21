class QnaPost < ActiveRecord::Base
    
    has_many :qna_comments
    
end
