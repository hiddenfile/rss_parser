RssParser::Application.routes.draw do
  root :to => "home#index"
  post "/home/parser" => "home#parser", :as => :home_parser
end
