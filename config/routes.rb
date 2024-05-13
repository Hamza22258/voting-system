# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'user#show'

  get '/profile', to: 'user#show'
  get '/search_vote', to: 'votes#search'
  get '/search_election/:id', to: 'elections#search'
  get '/home', to: 'user#home'
  get '/approved', to: 'candidate_profiles#index_admin'

  resources :votes, only: %i[index new create]
  resources :elections, only: %i[new create update show index]
  resources :candidate_profiles, only: %i[index destroy new create update]
end
