class PostosController < ApplicationController
  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @posto  = @tag.postos.page(params[:page])
    @users = User.all
  end
  
  def index
    @postos = Posto.all
    @users = User.all
  end
  
  def new
    @posto = Posto.new
  end
  
  def create
    @posto = Posto.new(posto_params)
    @posto.user_id = current_user.id
    if @posto.save
      redirect_to postos_path
    else
      render postos_path #変える
    end
  end
  
  def destroy
    @posto = Posto.find(params[:id])
    @posto.user_id = current_user.id
    @posto.destroy
    redirect_to postos_path
  end
  
  private
  
  def posto_params
    params.require(:posto).permit(:content, :hashtag_ids) 
  end
  
end
