# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :services, path: 'cpt-codes', only: :index do
        resources :offices, only: :index
      end
    end
  end
end
