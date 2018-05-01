class CommentsController < ApplicationController

  def create
    raise comment_params/inspect
    comment = Comment.create(comment_params)
    post = Post.find_by(id: comment_params[:post_id])
    post.comments << comment
    user = User.find_by(id: comment_params[:user_id])
    if !user
      user = User.create(username: => comment_params)
    end
    user.comments << comment
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
