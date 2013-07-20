Rssme::Application.routes.draw do
  
  scope :constraints => { :id => /\d+/ } do
    resources :items, only: :show
  end
  resources :read_items, only: :create
  resources :feeds

  root :to => 'feeds#index'

  mount Resque::Server, :at => "/resque"  

end
