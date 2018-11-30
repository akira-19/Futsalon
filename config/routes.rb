# frozen_string_literal: true

Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :players, controllers: {
    sessions: 'players/sessions',
    passwords: 'players/passwords',
    registrations: 'players/registrations'
  }
  resources :players, only: %i[show]

  devise_for :fields, controllers: {
    sessions: 'fields/sessions',
    passwords: 'fields/passwords',
    registrations: 'fields/registrations'
  }
  resources :fields


  devise_for :tournament_companies, controllers: {
    sessions: 'tournament_companies/sessions',
    passwords: 'tournament_companies/passwords',
    registrations: 'tournament_companies/registrations'
  }

# before login
  get '/feature1', to: 'static_pages#feature1'
  get '/feature2', to: 'static_pages#feature2'
  get '/feature3', to: 'static_pages#feature3'
  get '/players', to: 'static_pages#home'

  resources :teams, only: %i[new create edit update destroy show]
  resources :tournaments do
    collection do
      get :search, :prefecture
    end
  end
  resources :booking_fields

  resources :teams, only: [:show]
end
