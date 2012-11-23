require 'spec_helper'

describe Feedzirra::Parser::Base do
  describe "self.update_from_feed" do
    before :each do
      Feedzirra::Feed.should_receive(:add_feed_class).with(Feedzirra::Parser::ItunesPhotosRss)
      Feedzirra::Feed.should_receive(:add_feed_class).with(Feedzirra::Parser::TytAtom)
      Feedzirra::Feed.should_receive(:fetch_and_parse).with("http://news.tut.by/rss/index.rss")
    end
    it "should add rules class and create FeedEntries" do
      Feedzirra::Parser::Base.update_from_feed("http://news.tut.by/rss/index.rss")
    end

  end
end