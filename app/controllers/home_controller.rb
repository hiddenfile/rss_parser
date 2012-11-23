class HomeController < ApplicationController
  def index
    @feed_entries = FeedEntry.last(10)
  end

  def parser
    Feedzirra::Parser::Base.update_from_feed(params[:url])
    redirect_to :root
  end
end
