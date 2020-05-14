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

  def destroy
    @comment = Comment.find_by(
      id: params[:id],
      user_id: current_user.id,
      topic_id: params[:topic_id]
    )
    @comment.destroy
    redirect_to topic_path(params[:topic_id]), info: "コメントを削除しました"
  end
end
