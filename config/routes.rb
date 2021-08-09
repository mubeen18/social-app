Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  resources :articles do
    resources :comments
  end

  post '/articles/:id/like', to: 'articles#like', as: 'like'
  delete '/articles/:id/unlike', to: 'articles#unlike', as: 'unlike'

  post '/articles/:id/fav', to: 'articles#fav', as: 'fav'
  delete '/articles/:id/unfav', to: 'articles#unfav', as: 'unfav'

  get '/favorite',to: 'favorites#index', as: 'index'

end
