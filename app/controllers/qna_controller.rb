class QnaController < ApplicationController
  def list
    render :layout => false
  end

  def create
    if params[:title].empty? || params[:content].empty?
      flash[:error] = "제목과 내용을 확인해주세요."
      redirect_to :back
      return
    end
    
    p = QnaPost.new
    # p.user_id = current_user.id
    p.title = params[:title]
    p.content = params[:content]
    p.secret = false
    p.secret = true if params[:secret].to_i == 1
    p.save
    
    redirect_to :back
  end
  
  def create_c
    if params[:content].empty?
      flash[:error] = "내용을 확인해주세요."
      redirect_to '/qna/list'
      return
    end
    
    if QnaPost.where(id: params[:id]).nil?
      flash[:error] = "해당 게시글이 존재하지 않습니다."
      redirect_to '/qna/list'
      return
    end
    
    p = QnaComment.new
    # p.user_id = current_user.id
    p.qna_post_id = params[:id]
    p.content = params[:content]
    p.secret = false
    p.secret = true if params[:secret].to_i == 1
    p.save
    
    redirect_to '/qna/list'
  end

  def delete
    p = QnaPost.where(id: params[:id].to_i).first
    if p.nil?
      flash[:error] = "해당 글이 존재하지 않습니다."
      redirect_to '/qna/list'
      return
    end
    
    p.destroy
    redirect_to '/qna/list'
  end
  
  def delete_c
    p = QnaComment.where(id: params[:id].to_i).first
    if p.nil?
      flash[:error] = "해당 댓글이 존재하지 않습니다."
      redirect_to '/qna/list'
      return
    end
    
    p.destroy
    redirect_to '/qna/list'
  end

  def read
  end

  def update
    
    if params[:title].empty? || params[:content].empty?
      flash[:error] = "제목과 내용을 확인해주세요."
      redirect_to '/qna/list'
      return
    end
    
    p = QnaPost.where(id: params[:id]).first
    if p.nil?
      flash[:error] = "해당 게시글이 존재하지않습니다."
      redirect_to '/qna/list'
      return
    end
      
    # p.user_id = current_user.id
    p.title = params[:title]
    p.content = params[:content]
    p.secret = false
    p.secret = true if params[:secret].to_i == 1
    p.save
    
    redirect_to '/qna/list'
  end
end
