class RelationshipsController < ApplicationController
  
  def create
    @other_user = User.find(params[:follower])
    if  current_user.follow(params[:id])
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to postos_path
    else 
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to users_path
    end
  end

  def destroy
    @user = current_user.relathinoships.find(params[:id]).follower
    if  current_user.unfollow(params[:id])
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to postos_path
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to users_path
    end
  end

end
