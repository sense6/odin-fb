class PostsController < ApplicationController
    before_action :authenticate_user!
    helper_method :liked?
  # GET /posts
  # GET /posts.json

  def new
    @post = Post.new
  end

  def index
    @post = Post.new
    timeline_ids = current_user.friends.map(&:id)
    timeline_ids << current_user.id
    @posts = Post.where(user_id:timeline_ids).order(updated_at: :desc).page(params[:page])
    @comments = Comment.all
    @comment = Comment.new
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new


  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to request.referrer, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    respond_to do |format|

      if @post.update(post_params)
        format.html { redirect_to '/', notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def liked?(current_user,post)
    @like = Like.find_by(:user_id => current_user.id, :post_id => post.id)
      if @like
        true
      else
        false
      end
  end

  def delete_photo
    @post = Post.find(params[:format])
    @post.photo = nil
    @post.save
    redirect_to '/'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :photo)
    end
end
