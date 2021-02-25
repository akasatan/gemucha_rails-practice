class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
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
    
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
