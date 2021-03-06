class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @postos = @user.postos
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to postos_path, notice: "変更しました"
    else render :edit
    end
  end
  
  def following
      @user  = User.find(params[:id])
      @users = @user.following
      render users_path
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render users_path
  end
    
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
