class QnaComment < ActiveRecord::Base
    belongs_to :qna_post, :dependent => :destroy
end
