require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "Post 'parser'" do
    before :each do
      Feedzirra::Parser::Base.should_receive(:update_from_feed).with("http://news.tut.by/rss/index.rss")
    end
    it "sould run parser and returns http success" do
      get 'parser',:url => "http://news.tut.by/rss/index.rss"
      response.should redirect_to :root
    end
  end

end
