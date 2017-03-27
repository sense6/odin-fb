class InvitesController < ApplicationController
  def create
    #@invite = current_user.invite.build(:sender_id => current_user.id, :recever_id => params[:user_id])
    @invite = Invite.new(:sender_id => current_user.id, :recever_id => params[:recever_id])
    if @invite.save
      flash[:notice] = "Invite sent"
      redirect_to '/'
    else
      flash[:error] = "Unable to send invite"
      redirect_to '/'
    end
  end

  def destroy
    @invite = current_user.receved_invites.find_by(params[:id])
    @invite.destroy
  end

end
