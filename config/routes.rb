# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # get 'tasks/all'
  # post 'tasks/all'
  get 'tasks/all', to: 'tasks#all'
  get 'tasks/show'
  # get 'tasks/search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'tasks#index'

  resources :tasks
end
