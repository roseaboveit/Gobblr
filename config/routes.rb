Gobblr::Application.routes.draw do
  root 'welcome#index'

  post '/auth/:provider/callback' => 'sessions#create'
  get '/auth/:provider/callback'  => 'sessions#create' 
  get '/users/:id'                => 'users#show', as: :home
  post '/users/:id'               => 'feeds#create', as: :feeds
  get '/logout'                   => 'sessions#destroy', as: :logout
  get 'feeds/twitter_create'      => 'feeds#add_home_twitter_feed', as: :twitter_feed_create
  post '/posts/:id/favorite' => "posts#fave", as: :favorite
  post '/posts/:id/unfavorite' => "posts#unfave", as: :unfavorite
  post '/posts/:id/retweet' => "posts#retweet", as: :retweet

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

end
