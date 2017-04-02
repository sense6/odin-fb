class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!
  helper_method :pending_invite?, :friend?
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def index
    @users = User.all
  end

  def show
    @post = Post.new
    @user = User.find(params[:id])
    @posts = Post.where(user_id:@user.id).order(updated_at: :desc)
    @comments = Comment.all
    @comment = Comment.new
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def pending_invite?(sender, recever) #invcontroller alread checks for particular invite
    @invite = Invite.find_by(:sender_id => sender.id, :recever_id => recever.id)
    if @invite
      true
    else
      false
    end
  end

  def friend?(current_user, user)
    @friendship = Friendship.find_by(:user_id => current_user.id, :friend_id => user.id)
    if @friendship
      true
    else
      false
    end
  end
end
