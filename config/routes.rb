Peopletagger::Application.routes.draw do

  resources :tags
  resources :taggings, :only => [ :create, :destroy ]
  resources :entries
  
  match "browse", :to => 'entries#browse'
  match "retag", :to => 'entries#retag'
  match "search", :to => 'entries#search'

  root :to => 'entries#index'

end
