class TopicsController < ApplicationController
  def index
    @user = current_user
    @type = params[:type]

    if @type == "user"
      @topics = current_user.topics

    elsif @type == "favorite"
      # もし type が「favorite」だったら
      # @topics にログイン中ユーザがお気に入りしているトピックに絞り込んだものを入れる。
      @topics = current_user.favorite_topics

    elsif @type == "comment"
      # もし type が「commented」だったら
      # @topics にログイン中ユーザがコメントしたトピックに絞り込んだものを入れる。
      @topics = current_user.comment_topics.distinct

    else
      # もし type が上のどれでもなかったら
      # @topics はそのまま。
      @topics = Topic.eager_load(:user)
    end

    @topics = @topics.order(created_at: :desc)
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
