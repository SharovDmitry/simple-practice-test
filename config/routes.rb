# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'services#index'

  resources :services, only: :index do
    resources :offices, only: :index
  end
end
