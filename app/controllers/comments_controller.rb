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
    @entry = Entry.find @comment.entry_id

    if @comment.save
      @comments = @entry.comments.all
    else
      flash[:danger] = "You need follow to comment"
    end

    respond_to do |format|
      format.html {redirect_to @comment.entry}
      format.js {flash.clear}
    end
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit :body, :user_id, :entry_id
    end
end
