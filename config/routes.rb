Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'answers/show'
  get 'answers/index'
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

#   resources :users, only: [:show, :index, :edit, :update]
#   resources :cities, only: [:index, :show] do
#     resources :themes, only: [:index, :show] do
#       resources :theme_pois, only: [:index, :show]
#     end
#     resources :pois, only: [:index, :show] do
#       resources :theme_pois, only: [:index, :show]
#     end
#   end

#   namespace :admin do
#     resources :themes, only: [:new, :create, :edit, :update, :delete]
#     resources :users
#   end

# end

#   add_foreign_key "answers", "games"
#   add_foreign_key "answers", "pois"
#   add_foreign_key "answers", "users"
#   add_foreign_key "games", "themes"
#   add_foreign_key "theme_pois", "pois", column: "pois_id"
