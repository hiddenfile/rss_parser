module Feedzirra

  module Parser
    class TytItemAtom
      include SAXMachine
      include FeedEntryUtilities

      element :title
      element :description, :as => :summary
      element :guid, :with => {:isPermaLink => true}, :as => :url
      element :"pubDate", :as => :published


      #   <atom:author>
      #     <atom:name>Александр Обухович, специально для TUT.BY</atom:name>
      #   </atom:author>
      element :"atom:author", :as => :author, :class => Feedzirra::Parser::TytItemAuthorAtom
      element :"enclosure", :value => :url, :as => :enclosure
      element :"category", :as => :category
      element :"category", :value => :domain, :as => :category_domain

      elements :"media:content", :value => :url, :as => :media_content
    end
  end
end

