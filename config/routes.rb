# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :predictions, only: :create
  resources :matches do
    get :all, on: :collection
    get :upcoming, on: :collection
  end

  resources :users, only: :show

  get :about, to: 'pages#about'
  get :leaderboard, to: 'pages#leaderboard'
  get :rules, to: 'pages#rules'

  root to: 'matches#upcoming'
end
