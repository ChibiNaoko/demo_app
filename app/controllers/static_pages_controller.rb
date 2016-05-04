class StaticPagesController < ApplicationController

  def home
    @entries = Entry.all.paginate(page: params[:page], per_page: 5)
    if logged_in?
      @comment = Comment.new
      @entry = current_user.entries.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5)
    end
  end

  def help
  end

end
