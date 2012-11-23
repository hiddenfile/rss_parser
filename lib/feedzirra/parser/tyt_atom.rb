module Feedzirra

  module Parser
    class TytAtom
      include SAXMachine
      include FeedUtilities

      attr_accessor :feed_url

      # RSS 2.0 elements that need including
      element :title
      element :link, :as => :url
      element :description
      element :language


      element :image, :value => :url, :as => :image_url
      element :image, :value => {:title => :link}, :as => :image_title_link

      element :"pubDate", :as => :last_build_Date
      element :"lastBuildDate", :as => :last_build_Date
      element :ttl
      element :"atom:link", :value => :href, :as => :atom_link_href

      elements :item, :as => :entries, :class => Feedzirra::Parser::TytItemAtom

      def self.able_to_parse?(xml)
        /xmlns:media="http:\/\/search.yahoo.com\/mrss\/"/i =~ xml
      end
    end
  end
end

