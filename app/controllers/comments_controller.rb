class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build(
      user_id: current_user.id,
      content: params[:comment][:content],
      topic_id: params[:comment][:topic_id]
    )
  
    if @comment.save
      redirect_to topic_path(@topic), success: 'コメントしました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end
end
