class StaticPagesController < ApplicationController

  def home
    @entries = Entry.all.paginate(page: params[:page], per_page: 5)
    # @entry = Entry.find_by_id @comment.entry_id
    # @comments = @entry.comments.all
    if logged_in?
      @entry = current_user.entries.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5)
    end
  end

  def help
  end

end
