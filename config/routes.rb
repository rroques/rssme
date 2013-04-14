Rssme::Application.routes.draw do
  resources :feeds

  root :to => 'feeds#index'

end
