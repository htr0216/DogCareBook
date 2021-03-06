class UsersController < ApplicationController
  def show
    @user = current_user
    @topics = @user.topics.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(update_params)
      redirect_to user_path, success: 'ユーザー情報を編集しました。'
    else
      flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) #:image, :nickname, :sex, :age
  end

  def update_params
    params.require(:user).permit(:name, :email, :image_name, :nickname, :sex, :birth_date)
  end
end
