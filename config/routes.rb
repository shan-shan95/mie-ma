# frozen_string_literal: true

Rails.application.routes.draw do
  root controller: 'root', action: 'index'
  resources :root, only: [:show]
end
