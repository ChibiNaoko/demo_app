class CommentsController < ApplicationController

  def index
    @comment = Comment.all
  end

  def show

  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @entry = Entry.find_by_id @comment.entry_id
    if current_user = @entry.user or current_user.following.include?(@entry.user)
      @comments = @entry.comments.all

#      @comments = @entry.comments.all
    else
      flash[:danger] = "You need follow to comment"
      redirect_to @comment.entry
      return
    end
    if @comment.save
      redirect_to @comment.entry
    end
  end

  def destroy

  end

  private
    def comment_params
      params.require(:comment).permit :body, :user_id, :entry_id
    end
end
