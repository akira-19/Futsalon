# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :players, controllers: {
    sessions: 'players/sessions',
    passwords: 'players/passwords',
    registrations: 'players/registrations'
  }
  devise_for :fields, controllers: {
    sessions: 'fields/sessions',
    passwords: 'fields/passwords',
    registrations: 'fields/registrations'
  }
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

# login as a player
  get '/team', to: 'static_pages#team'
  get '/tournament', to: 'static_pages#tournament'
  get '/field', to: 'static_pages#field'
  get '/manage', to: 'static_pages#manage'

# login as a field
  get '/schedule', to: 'fields#schedule'
  get '/tournament_management', to: 'fields#tournament_management'

# login as a tournment

  resources :teams, only: [:show]
end
