class LikesController < ApplicationController
  def create
    @like = Like.new(:user_id => params[:user_id], :post_id => params[:post_id])
    if @like.save
      flash[:notice] = 'liked!'
      redirect_to '/'
    else
      flash[:error] = 'could not like'
      redirect_to '/'
    end
  end

  def destroy
    @like = Like.find_by(:user_id => params[:user_id], :post_id => params[:post_id])
    @like.destroy
    flash[:notice] = 'unliked'
    redirect_to '/'
  end

end
