class FriendshipController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @inversed_friend = User.find_by(:id => params[:friend_id])
    @inversed_friendship = @inversed_friend.friendships.build(:friend_id => current_user.id)

    if @friendship.save && @inversed_friendship.save
      flash[:notice] = "Added friend."
      @invite = current_user.receved_invites.find_by(:sender_id => params[:friend_id])
      @invite.destroy
      redirect_to '/show_user'
    else
      flash[:error] = "Unable to add friend."
      redirect_to '/show_user'
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by(params[:id])
    @inversed_friend = User.find_by(:id => @friendship.friend_id)
    @inversed_friendship = @inversed_friend.friendships.find_by(:friend_id => current_user.id)
    @friendship.destroy
    @inversed_friendship.destroy
    flash[:notice] = "Removed friend"
    redirect_to '/show_user'
  end
end
