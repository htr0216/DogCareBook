class TopicsController < ApplicationController
  def index
    @user = current_user
    @topics = Topic.eager_load(:user).order(created_at: :desc)
    type = params[:type]
    if type == "user"
      @topics = Topic.where(user_id: @user.id)
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @user = @topic.user
    @comments = @topic.comments
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path, success: '投稿しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end
  
  def destroy
    #binding.pry
    @topic = current_user.topics.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end
  
  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
