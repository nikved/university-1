University::Application.routes.draw do

  resources :schedules

  resources :days

  resources :lessons

  resources :teachers

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'students#new', :as => 'signup'

  resources :sessions
  resources :students

  root :to => 'home#index'


end
