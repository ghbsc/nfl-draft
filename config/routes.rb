NflDraft::Application.routes.draw do
  get "ownerships/draft"
  get "ownerships/pick"
  #get "player/index"
  resources :players, only: [:index]
  root :to => 'visitors#new'
end
