# frozen_string_literal: true

Rails.application.routes.draw do

  get 'players/team_register'

  root 'static_pages#home'
  get '/search', to: 'static_pages#search'

  devise_for :players, controllers: {
    sessions: 'players/sessions',
    passwords: 'players/passwords',
    registrations: 'players/registrations'
  }
  resources :players, only: %i[show update]

  devise_for :fields, controllers: {
    sessions: 'fields/sessions',
    passwords: 'fields/passwords',
    registrations: 'fields/registrations'
  }
  resources :fields, only: %i[index show] do
    collection do
      get :search, :prefecture
    end
  end


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

  resources :play_fors, only: %i[new create edit update destroy]

  resources :tournaments do
    collection do
      get :search, :prefecture
    end
  end

  resources :booking_fields do
    collection do
      post 'purchase'
    end
  end

end
