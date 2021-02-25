class PostosController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @posto  = @tag.postos.page(params[:page])
    @users = User.all
  end
  
  def index
    @postos = Posto.page(params[:page]).reverse_order
    @tags = Hashtag.all
    @search = Posto.ransack(params[:q])
    @results = @search.result
    @check = params[:q]
  end
  
  def new
    @posto = Posto.new
  end
  
  def show
    @posto = Posto.find(params[:id])
  end
  
  def create
    @posto = Posto.new(posto_params)
    @posto.user_id = current_user.id
    if @posto.save
      redirect_to postos_path
    else
      render index
    end
  end
  
  def destroy
    @posto = Posto.find(params[:id])
    if @posto.destroy
       redirect_to postos_path
    else render postos_path
    end
  end
  
  private
  
  def posto_params
    params.require(:posto).permit(:content, :hashtag_ids) 
  end
  
end
