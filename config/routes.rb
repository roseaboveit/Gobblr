Gobblr::Application.routes.draw do
  root 'welcome#index'

  post '/auth/:provider/callback' => 'sessions#create'
  get '/auth/:provider/callback'  => 'sessions#create' 
  get '/users/:id'                => 'users#show', as: :home
  post '/users/:id'               => 'feeds#create', as: :feeds
  get '/logout'                   => 'sessions#destroy', as: :logout
  get 'feeds/twitter_create'      => 'feeds#add_home_twitter_feed', as: :twitter_feed_create
  post '/posts/:id/'              => "posts#fave", as: :favorite

end
