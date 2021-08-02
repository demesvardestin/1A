class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save!
    
    commentable = Commentable.find(params[:comment][:commentable_id])
    @commentable = commentable.object_type.constantize.find(commentable.object_id)
    
    redirect_to blog_show_article_path(:slug => @commentable.slug, :id => @commentable.id), notice: "thanks for participating in the conversation!"
  end
  
  private
  
  def comment_params
    params.require(:comment)
    .permit(
      :commenter_name,
      :commenter_email,
      :content,
      :commentable_id
      )
  end
end
