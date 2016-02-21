class QnaController < ApplicationController
  def list
  end

  def create
    if params[:title].empty? || params[:content].empty?
      flash[:error] = "제목과 내용을 확인해주세요."
      redirect_to :back
    end
    
    p = QnaPost.new
    # p.user_id = current_user.id
    p.title = params[:title]
    p.content = params[:content]
    p.secret = false
    p.secret = true if params[:secret].to_i == 1
    p.save
    
  end

  def delete
  end

  def read
  end

  def update
  end
end
