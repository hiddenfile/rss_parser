module Feedzirra

  module Parser
    class TytItemAuthorAtom
      include SAXMachine
      include FeedEntryUtilities
      element :"atom:name", :as => :name
      element :"atom:url", :as => :url
      def to_s
        name
      end
    end
  end
end

