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
    @user = current_user
 
  end
  
  def update
    @user = current_user
    #binding.pry
    #Rails.logger.debug { "user_params: #{user_params}" }
      if @user.update_attributes(update_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        render :show
        
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end
      
    
      #redirect_to root_url
    
    
 
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) #:image, :nickname, :sex, :age
  end
  
  def update_params
    params.require(:user).permit(:name, :email, :image_name, :nickname, :sex, :birth_date)
  end
  
  
end
