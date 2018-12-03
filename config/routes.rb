Rails.application.routes.draw do
  get 'users/show'
  get 'pois/show'
  get 'pois/index'
  get 'themes/show'
  get 'themes/index'
  get 'cities/show'
  get 'cities/index'
  get 'games/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
