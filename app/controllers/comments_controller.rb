class CommentsController < ApplicationController
  before_action :set_comment, except: :create
  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.create comment_params
    redirect_to post_path @post
  end
 
 	def update
    unless @comment.user == current_user
      redirect_to post_path @comment.post, status: :unauthorised
    end
    @comment.update comment_params
  end

  def destroy
    unless @comment.user == current_user || @comment.post.user == current_user
      redirect_to post_path @comment.post, status: :unauthorised
    else
      @comment.destroy
      redirect_to @comment.post, notice: 'Comment was successfully deleted'
    end
  end

  private

  def set_comment
    @comment = Comment.find params[:id]
  end

  def comment_params
    params.require(:comment).permit(:body).merge user: current_user
  end

end
