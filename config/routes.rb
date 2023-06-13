# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  
  resources :users, only: %i[index new create ] do 
  #delete 'users/:id', to: 'users#destroy'
  member do
    delete :deleted 
  end
end

  devise_for :members
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  # devise_scope :user do
  #   authenticated :user do
  #     namespace :users do
  #       get 'dashboard/index', as: :authenticated_root
  #     end
  #   end
  # end
  # devise_scope :member do
  #   authenticated :member do
  #     namespace :member do
  #       get 'dashboard/index', as: :authenticated_root
  #     end
  #   end
  # end
  
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  # Defines the root path route ("/")

  root 'tasks#index'
  #delete 'users/:id', to: 'users#destroy'
  

  resources :tasks
end
