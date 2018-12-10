Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :index, :edit, :update]

  resources :cities, only: [:index] do
    resources :themes, only: [:index]
  end

  resources :themes, only: [] do
    resources :games, only: [ :create ]
  end

  resources :games, only: [] do
    resources :pois, only: [:show] do
      resources :answers, only: [:create, :show]
    end
  end

  resources :games, only: [ :index, :show, :update ]

end


#                    Prefix Verb   URI Pattern                                                                              Controller#Action

#                      root GET    /                                                                                        pages#home

#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create
#                     users GET    /users(.:format)                                                                         users#index
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update

#               city_themes GET    /cities/:city_id/themes(.:format)                                                        themes#index
#                    cities GET    /cities(.:format)                                                                        cities#index

#               theme_games POST   /themes/:theme_id/games(.:format)                                                        games#create

#          game_poi_answers POST   /games/:game_id/pois/:poi_id/answers(.:format)                                           answers#create
#                     games GET    /games(.:format)                                                                         games#index
#                      game GET    /games/:id(.:format)                                                                     games#show



# ? POST WAGON - ADMIN ?

# namespace :admin do
#   resources :cities, except: [:index, :show] do
#     resources :themes, only: [:new, :create, :edit, :update]
#   end
# end
