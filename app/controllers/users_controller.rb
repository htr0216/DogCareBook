class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end
  
  def new
    @user = User.new
  end
  
  def create
    #binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  
  
  def edit
    #@user = User.find_by(id: params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) #:image, :nickname, :sex, :age
  end
end
