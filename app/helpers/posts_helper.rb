module PostsHelper
  def liked?(current_user,post)
    @like = Like.find_by(:user_id => current_user.id, :post_id => post.id)
      if @like
        true
      else
        false
      end
  end
end
