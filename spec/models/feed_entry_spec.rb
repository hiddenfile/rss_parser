require 'spec_helper'

describe FeedEntry do

  describe "serialize custom_fields" do
    before :each do
      @fd = FactoryGirl.create(:feed_entry)
    end
    it "deserializes the hash" do
      @fd.reload.custom_fields.should eq({a: :b})
    end
  end

  describe "self.add_entries" do
    before :each do
      @feed_entries = Feedzirra::Feed.fetch_and_parse("http://rss.cnn.com/rss/edition.rss").entries
    end

    it "should create FeedEntry" do
      FeedEntry.count.should eq 0
      FeedEntry.add_entries(@feed_entries)
      FeedEntry.count.should eq @feed_entries.map(&:id).uniq.count
    end
  end


end
