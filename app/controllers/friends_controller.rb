class FriendsController < ApplicationController
  # le controller friend sert à faire la relation entre deux users pour qu'ils puissent s'ajouter.
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  
  def index
    @friends = Friend.all
  end

  
  def show
  end

  
  def new
    @friend = Friend.new
  end


  def edit
  end


  def create
  @friends = current_user.friends.build(:new_friend => params[:new_friend])
  if @friends.save
    flash[:notice] = "Added friend."
    redirect_to profil_path(current_user.id)
  else
    flash[:notice] = "Unable to add friend."
    redirect_to root_url
  end
end


  def destroy
  @friends = current_user.friends.find(params[:id])
  @friends.destroy
  flash[:notice] = "Removed friendship."
  redirect_to profil_path(current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:user_id, :new_friend)
    end
end