class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(:post_id => params[:format])
    if @like.save
      flash[:notice] = 'liked!'
      redirect_to '/'
    else
      flash[:error] = 'could not like'
      redirect_to '/'
    end
  end

  def destroy
    @like = current_user.likes.where(:post_id => params[:id])
    @like.destroy(@like.first)
    flash[:notice] = 'unliked'

    redirect_to '/'
  end

end
