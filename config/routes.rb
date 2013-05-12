Rssme::Application.routes.draw do
  

  resources :items do
    resources :read_items
  end  

  resources :feeds

  root :to => 'feeds#index'

  mount Resque::Server, :at => "/resque"  

end
