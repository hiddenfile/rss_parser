module Feedzirra

  module Parser
    class ItunesPhotosRss
      include SAXMachine
      include FeedUtilities

      attr_accessor :feed_url

      # RSS 2.0 elements that need including
      element :copyright
      element :description
      element :language
      element :"webMaster", :as => :managingEditor
      element :title
      element :link, :as => :url


      element :"lastBuildDate", :as => :last_build_Date
      element :generator
      element :ttl
      element :"dc:creator", :as => :dc_creator
      element :"dc:date", :as => :dc_date
      element :"sy:updatePeriod", :as => :sy_update_period
      element :"sy:updateFrequency", :as => :sy_update_frequency
      element :"sy:updateBase", :as => :sy_update_base

      elements :item, :as => :entries, :class => Feedzirra::Parser::ItunesRssItem

      def self.able_to_parse?(xml)
        /xmlns:itms=\"http:\/\/phobos.apple.com\/rss\/1\.0\/modules\/itms\/"/i =~ xml
      end
    end
  end
end

