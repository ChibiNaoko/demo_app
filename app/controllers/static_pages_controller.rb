class StaticPagesController < ApplicationController

  def home
    @entry = current_user.entries.build if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5)
  end

  def help
  end

end
