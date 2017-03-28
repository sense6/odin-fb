class InvitesController < ApplicationController
  def create
    @invite = Invite.new(:sender_id => current_user.id, :recever_id => params[:recever_id])
    @duplication = Invite.find_by_sender_id_and_recever_id(params[:sender_id], params[:recever_id])
    if  @duplication.blank? && @invite.save
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
