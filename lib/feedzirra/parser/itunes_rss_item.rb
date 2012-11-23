module Feedzirra

  module Parser
    class ItunesRssItem
      include SAXMachine
      include FeedEntryUtilities

      element :"itms:artist", :as => :author
      element :title
      element :link, :as => :url
      element :description, :as => :summary
      element :pubDate, :as => :published


      element :"content:encoded", :as => :content_encoded
      element :"category", :as => :category
      element :"category", :value => :domain, :as => :category_domain
      element :"itms:artistLink", :as => :itms_artistLink
      element :"itms:album", :as => :itms_album
      element :"itms:albumLink", :as => :itms_album_link
      element :"itms:albumPrice", :as => :itms_album_price
      element :"itms:rights", :as => :itms_rights
      element :"itms:releasedate", :as => :itms_releasedate

      elements :"itms:coverArt", :as => :itms_cover_arts
    end
  end
end

