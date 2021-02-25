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
    if @user.update
      redirect_to postos_path
    else render edit
    end
  end
    
end
