module Feedzirra
  module Parser

    class Base
      class << self

        def update_from_feed(feed_url)
          Feedzirra::Feed.add_feed_class Feedzirra::Parser::ItunesPhotosRss
          Feedzirra::Feed.add_feed_class Feedzirra::Parser::TytAtom
          if feed = Feedzirra::Feed.fetch_and_parse(feed_url)
            FeedEntry.add_entries(feed.entries)
          end
        end

      end
    end

  end
end
