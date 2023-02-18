# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :budgets do
    resources :accounts
  end

  # Defines the root path route ("/")
  root 'budgets#index'
end
