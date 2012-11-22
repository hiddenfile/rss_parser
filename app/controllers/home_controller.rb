class HomeController < ApplicationController
  def index
    @feed_entries = FeedEntry.all
  end
end
