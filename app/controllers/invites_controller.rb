class InvitesController < ApplicationController
  helper_method :invited?

  def create
    @invite = Invite.new(:sender_id => current_user.id, :recever_id => params[:recever_id])
    @duplication = Invite.find_by_sender_id_and_recever_id(params[:sender_id], params[:recever_id])
    if  @duplication.blank? && @invite.save
      flash[:notice] = "Invite sent"
      redirect_to '/users'
    else
      flash[:error] = "Unable to send invite"
      redirect_to '/users'
    end
  end

  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy
    redirect_to request.referrer
  end
end
