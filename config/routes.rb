# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
            confirmations: "users/confirmations",
            registrations: "users/registrations",
            sessions: "users/sessions",
            passwords: "users/passwords",
          }

  root controller: "items", action: "index"

  resources :items, except: :index do
    member do
      patch :purchase
      get :public_messages
      get :private_messages
    end
  end

  resources :trading_messages, only: :create

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
