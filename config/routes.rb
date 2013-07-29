Rssme::Application.routes.draw do
  
  scope :constraints => { :id => /\d+/ } do
    resources :items, only: :show
  end
  resources :read_items, only: :create
  resources :feeds
  post 'feeds/:id/markAllRead', to: 'feeds#mark_all_read' 

  root :to => 'feeds#index'

  mount Resque::Server, :at => "/resque"  

end
