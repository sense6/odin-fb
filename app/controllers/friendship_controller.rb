class FriendshipController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to '/'
    else
      flash[:error] = "Unable to add friend."
      redirect_to '/'
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friend"
    redirect_to ''
  end
end
